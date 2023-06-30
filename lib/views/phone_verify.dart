import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2_2/services/user.provider.dart';
import 'package:http/http.dart' as http;

class PhoneVerifyPage extends StatefulWidget {
  const PhoneVerifyPage({super.key});

  @override
  State<PhoneVerifyPage> createState() => _PhoneVerifyPageState();
}

class _PhoneVerifyPageState extends State<PhoneVerifyPage> {
  final TextEditingController movil = TextEditingController();
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

  Future<Prospecto> alcutalizarProspecto(String movil) async {
    final response = await http.put(
        Uri.parse('http://idemo.brave.com.mx/api/pospecto/75'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{'movil': movil}));

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
                      const Text(
                        'Verificar Telefono',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
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
                          helperText: 'XXXX XXXX XX',
                          border: OutlineInputBorder(),
                          isDense: false,
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _futureProspecto =
                                  alcutalizarProspecto(movil.text);
                            });
                          },
                          child: const Text(
                            'Actualizar',
                            style: TextStyle(fontSize: 15),
                          )),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Obtener codigo',
                            style: TextStyle(fontSize: 15),
                          ))
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
