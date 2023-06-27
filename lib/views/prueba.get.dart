import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../services/user.provider.dart';

class PruebaGet extends StatefulWidget {
  const PruebaGet({super.key});

  @override
  State<PruebaGet> createState() => _PruebaGetState();
}

class _PruebaGetState extends State<PruebaGet> {
  Prospecto? prospecto;

  @override
  void initState() {
    super.initState();
    getProspecto;
  }

  Future<void> getProspecto() async {
    var response = await Dio().get('http://idemo.brave.com.mx/api/pospecto/60');

    prospecto = Prospecto.fromJson(response.data);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peticion Http'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(prospecto?.nombre ?? 'No data')],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.navigate_next), onPressed: () {}),
    );
  }
}
