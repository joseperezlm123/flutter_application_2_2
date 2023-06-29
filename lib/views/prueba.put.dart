import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2_2/services/user.provider.dart';
import 'package:http/http.dart' as http;

class PruebaPut extends StatefulWidget {
  const PruebaPut({super.key});

  @override
  State<PruebaPut> createState() => _PruebaPutState();
}

class _PruebaPutState extends State<PruebaPut> {
  final TextEditingController nombre = TextEditingController();
  final TextEditingController email = TextEditingController();
  late Future<Prospecto> _futureProspecto;

  Future<Prospecto> buscarProspecto() async {
    final response = await http.get(
      Uri.parse('http://idemo.brave.com.mx/api/pospecto/75'),
    );
    if (response.statusCode == 200) {
      return Prospecto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Prospecto');
    }
  }

  Future<Prospecto> alcutalizarProspecto(String email) async {
    final response = await http.put(
        Uri.parse('http://idemo.brave.com.mx/api/pospecto/75'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{'email': email}));

    if (response.statusCode == 200) {
      return Prospecto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update Prospecto');
    }
  }

  @override
  void initState() {
    super.initState();
    _futureProspecto = buscarProspecto();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Usuarios',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Descarga'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: FutureBuilder<Prospecto>(
            future: _futureProspecto,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.data!.email),
                      TextField(
                        controller: nombre,
                        decoration: const InputDecoration(
                            hintText: 'Introduce tu nombre'),
                      ),
                      TextFormField(
                        controller: email,
                        validator: (valor) {
                          String pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regExp = new RegExp(pattern);

                          return regExp.hasMatch(valor ?? '')
                              ? null
                              : 'El correo no es correcto';
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          helperText: 'correo@correo.com',
                          border: OutlineInputBorder(),
                          isDense: false,
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'PhoneVerifyPage');
                            setState(() {
                              _futureProspecto =
                                  alcutalizarProspecto(email.text);
                            });
                          },
                          child: const Text('Descargar data'))
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
