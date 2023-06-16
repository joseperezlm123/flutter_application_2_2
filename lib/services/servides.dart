import 'dart:convert';
import 'dart:io';
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

  //PUT
  Future<dynamic> put(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object);
    debugPrint(object.toString());
    try {
      var response = await client.put(
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

  //GET NEW

  static Future<http.Response?> postRequest(String path,
      {Map<String, dynamic>? bodyJson, String? token}) async {
    final url = Uri.parse('$baseUrl/$path');

    try {
      Map<String, String> headers = {};

      headers = {
        "Content-Type": "application/json",
        "Accept": "application/json"
      };

      final body = json.encode(bodyJson);

      final response = await http.post(url, body: body, headers: headers);
      return response;
    } catch (e) {
      throw HttpException('Falied to fetch data: $e');
    }
  }

  //GET NEW

  static Future<http.Response?> getRequest(String path, {String? token}) async {
    final url = Uri.parse('$baseUrl/$path');
    try {
      Map<String, String> headers = {};
      headers = {
        "Content-Type": "application/json",
        "Accept": "application/json"
      };

      final response = await http.get(url, headers: headers);
      return response;
    } catch (e) {
      throw HttpException('Failed to fetch data $e');
    }
  }
}
