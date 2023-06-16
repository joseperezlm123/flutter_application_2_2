import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2_2/models/user.provider.dart';
import 'package:flutter_application_2_2/services/predditcs_res_model.dart';
import 'package:flutter_application_2_2/services/predictions.dart';
import 'package:flutter_application_2_2/services/servides.dart';

//import 'package:http/http.dart' as http;

class AppStateChangeNotifier extends ChangeNotifier {
  bool _isLoading = false;

  //Getter
  bool get isLoading => _isLoading;

  void getPredicts(BuildContext cxt, Post reqData) async {
    _isLoading = true;
    notifyListeners();
    try {
      final res =
          await BaseClient.postRequest("/1", bodyJson: reqData.toJson());

      if (res == null) {
        _isLoading = false;
        notifyListeners();
        return;
      }

      PredicResModel searchResultsRes =
          PredicResModel.fromJson(jsonDecode(res.body));

      if (searchResultsRes.isError) {
        if (cxt.mounted) {
          SnackBar snackBar = SnackBar(
            content: Text(searchResultsRes.msg),
            duration: const Duration(seconds: 2),
          );
          ScaffoldMessenger.of(cxt).showSnackBar(snackBar);
        }
        _isLoading = false;
        notifyListeners();
        return;
      }

      PredicResModelData? data = searchResultsRes.data;
      if (cxt.mounted) {
        Navigator.push(
            cxt, MaterialPageRoute(builder: (context) => Predictions(data)));
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      print('error: $e --------------');
      SnackBar snackBar = const SnackBar(
        content: Text('Some error ocurred'),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(cxt).showSnackBar(snackBar);
      return;
    }
  }
}
