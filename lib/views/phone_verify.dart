import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../utils/global.colors.dart';

class PhoneVerifyPage extends StatefulWidget {
  PhoneVerifyPage({super.key});

  @override
  State<PhoneVerifyPage> createState() => _PhoneVerifyPageState();
}

class _PhoneVerifyPageState extends State<PhoneVerifyPage> {
  final _keyForm = GlobalKey<FormState>();

  TextEditingController movil = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController _controller = TextEditingController();
  Future<dynamic> updateAlbum(dynamic object, String nombre) async {
    final response = await http.put(
      Uri.parse('http://idemo.brave.com.mx/api/pospecto'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': nombre,
      }),
    );
    if (response.statusCode == 200) {
      return object.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _keyForm,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Verificar Telefono',
                      style: TextStyle(
                        color: GlobalColors.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text(
                        'Ingresa tu telefono',
                        style: TextStyle(
                          color: GlobalColors.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Email Input
                  TextFormField(
                    validator: (valor) {
                      String pattern =
                          r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$';
                      RegExp regExp = new RegExp(pattern);

                      return regExp.hasMatch(valor ?? '')
                          ? null
                          : 'El Telefono no es valido';
                    },
                    controller: movil,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Telefono',
                      helperText: '+52 xxxx xxxx xx ',
                      border: OutlineInputBorder(),
                      isDense: false,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.blue),
                        ),
                        onPressed: () async {
                          setState(() {
                            _futureAlbum = updateAlbum(_controller.text);
                          });
                        },
                        child: const Column(
                          children: [
                            Text(
                              'Inicio',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

late Future<dynamic> _futureAlbum;
