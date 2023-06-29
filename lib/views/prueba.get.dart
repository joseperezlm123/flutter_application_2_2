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
  final TextEditingController email = TextEditingController();
  late Future<Prospecto> prospecto;
  final url = Uri.parse('http://idemo.brave.com.mx/api/pospecto');
  final headers = {"Content-Type": "application/json;charset=UTF-8"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios Api'),
      ),
      body: FutureBuilder<Prospecto>(
          future: prospecto,
          builder: (context, snap) {
            if (snap.hasData) {
              return Column(
                children: [
                  ListTile(
                    title: Text(snap.data!.nombre),
                    subtitle: Text(snap.data!.email),
                  ),
                  const Divider()
                ],
              );
            }
            if (snap.hasError) {
              return Center(
                child: Text('Ha habido un error: ${snap.error}'),
              );
            }
            return const CircularProgressIndicator();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: showForm,
        child: const Icon(Icons.add),
      ),
    );
  }

  void showForm() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Agregar Usuario'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nombre,
                  decoration:
                      const InputDecoration(hintText: 'Apellido Paterno'),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: email,
                  decoration: const InputDecoration(hintText: 'email'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancelar'),
              ),
              TextButton(
                  onPressed: () {
                    saveProspecto();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Enviar'))
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    prospecto = getProspecto();
  }

  Future<Prospecto> getProspecto() async {
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      final Prospecto pros = Prospecto.fromJson(json);
      return pros;
    }
    return Future.error('No se pudo cargar la informacion de usuario');
  }

  void saveProspecto() async {
    final pros = {"nombre": nombre.text, "email": email.text};
    await http.post(url, headers: headers, body: jsonEncode(pros));
    nombre.clear();
    email.clear();
    setState(() {
      prospecto = getProspecto();
    });
  }
}
