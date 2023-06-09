import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "http://idemo.brave.com.mx/api/pospecto";

class BaseClient {
  var client = http.Client();

  //GET
  Future<dynamic> get(String api) async {
    var url = Uri.http(baseUrl + api);

    var response = await client.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {}
  }

  //POST
  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object);
    debugPrint(object.toString());
    var response = await client.post(
      url,
      body: _payload,
      headers: {"Content-Type": "application/json"},
    );
    //  if (response.statusCode == 200) {
    return response.body;
    //  } else {
    //    return "marco error";
    //  }
  }

  Future<dynamic> put(String api) async {}
  Future<dynamic> delete(String api) async {}
}
