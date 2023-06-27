import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../services/user.provider.dart';

class PruebaGet extends StatefulWidget {
  const PruebaGet({super.key});

  @override
  State<PruebaGet> createState() => _PruebaGetState();
}

class _PruebaGetState extends State<PruebaGet> {
  final TextEditingController nombre = TextEditingController();
  late Future<Prospecto> _futureProspecto;
  @override
  void initState() {
    super.initState();
    _futureProspecto = buscarProspecto();
  }

// PUT FUNCION
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
// END PUT

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peticion Http'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              child: FutureBuilder<Prospecto>(
                future: _futureProspecto,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(snapshot.data!.nombre),
                          TextField(
                            controller: nombre,
                            decoration: const InputDecoration(
                              hintText: 'Enter Name',
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _futureProspecto =
                                    alcutalizarProspecto(nombre.text);
                              });
                            },
                            child: const Text('Update Data'),
                          )
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                  }
                  return const CircularProgressIndicator();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
