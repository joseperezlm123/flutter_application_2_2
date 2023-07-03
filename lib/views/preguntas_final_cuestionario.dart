import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_2_2/services/user.provider.dart';
import 'package:http/http.dart' as http;

class PruebaPutPreguntas extends StatefulWidget {
  const PruebaPutPreguntas({super.key});

  @override
  State<PruebaPutPreguntas> createState() => _PruebaPutPreguntasState();
}

class _PruebaPutPreguntasState extends State<PruebaPutPreguntas> {
  final TextEditingController ingreso = TextEditingController();
  final TextEditingController ingreso_tipo = TextEditingController();
  late Future<Prospecto> _futureProspecto;

  Future<Prospecto> buscarProspecto() async {
    final response = await http.get(
      Uri.parse('http://idemo.brave.com.mx/api/pospecto/77'),
    );
    if (response.statusCode == 200) {
      return Prospecto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Prospecto');
    }
  }

  Future<Prospecto> alcutalizarProspecto(
      String ingreso, String ingreso_tipo) async {
    final response = await http.put(
        Uri.parse('http://idemo.brave.com.mx/api/pospecto/77'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
            <String, String>{'ingreso': ingreso, 'ingresoTipo': ingreso_tipo}));

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
          title: const Text('Confirmar Datos'),
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
                      const SizedBox(
                        height: 50,
                      ),
                      const Text('A continuacion ingresa tu ingreso mensual'),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: ingreso,
                        validator: (valor) {
                          String pattern = r'/^[\d]{0,11}(\.[\d]{1,2})?$/';
                          RegExp regExp = new RegExp(pattern);

                          return regExp.hasMatch(valor ?? '')
                              ? null
                              : 'El monto no es correcto';
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Ingreso fijo mensual',
                          border: OutlineInputBorder(),
                          isDense: false,
                          filled: true,
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('De que forma consigues tus ingresos'),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: ingreso_tipo,
                        validator: (valor) {
                          String pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regExp = new RegExp(pattern);

                          return regExp.hasMatch(valor ?? '')
                              ? null
                              : 'El correo no es correcto';
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: 'Tipo de ingreso',
                          border: OutlineInputBorder(),
                          isDense: false,
                          filled: true,
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _futureProspecto = alcutalizarProspecto(
                                  ingreso.text, ingreso_tipo.text);
                            });
                          },
                          child: const Text('Actualizar')),
                      const SizedBox(
                        height: 10,
                      ),
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
