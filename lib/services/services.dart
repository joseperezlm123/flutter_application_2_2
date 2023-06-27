import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2_2/services/user.provider.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "http://idemo.brave.com.mx/api/pospecto";

class BaseClient {
  var client = http.Client();

  //GET
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var _headers = {"Content-Type": "application/json"};
    var response = await client.get(url, headers: _headers);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw Exception('Fallo al cargar get');
    }
  }

  //POST
  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object);
    debugPrint(object.toString());
    try {
      var response = await client.post(
        url,
        body: _payload,
        headers: {"Content-Type": "application/json"},
        // ignore: body_might_complete_normally_catch_error
      );
      //  if (response.statusCode == 200) {
      return response.body;
      //  } else {
      //    return "marco error";
      //  }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

//DELETE
  Future<dynamic> delete(String api) async {}
//PUT
  Future<Prospecto> buscarProspecto() async {
    final response = await http.get(
      Uri.parse('http://idemo.brave.com.mx/api/pospecto/60'),
    );
    if (response.statusCode == 200) {
      return Prospecto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Prospecto');
    }
  }

  Future<Prospecto> alcutalizarProspecto(String nombre) async {
    final response = await http.put(
        Uri.parse('http://idemo.brave.com.mx/api/pospecto/60'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{'nombre': nombre}));

    if (response.statusCode == 200) {
      return Prospecto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update Prospecto');
    }
  }

  //PutRequest
}
