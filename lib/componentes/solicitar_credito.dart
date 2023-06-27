import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2_2/utils/select_image.dart';

class SolicitarCredito extends StatefulWidget {
  const SolicitarCredito({super.key});

  @override
  State<SolicitarCredito> createState() => _SolicitarCreditoState();
}

class _SolicitarCreditoState extends State<SolicitarCredito> {
  File? imagen_to_upload;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Tus datos'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                      'Sube un comprobante de tu domicilio particular actual'),
                ),
                const Text('Puedes usar:'),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                    '-Recibo de servicio como luz, agua, telefono gas o predial (menor a 3 meses y puede estar a nombre de otra persona)'),
                const SizedBox(
                  height: 20,
                ),
                const Text('-Foto de tu INE o IFE)'),
                const SizedBox(
                  height: 20,
                ),
                const Text('-Contancia de tu RFC)'),
                const SizedBox(
                  height: 20,
                ),
                imagen_to_upload != null
                    ? Image.file(imagen_to_upload!)
                    : Container(
                        margin: const EdgeInsets.all(10),
                        height: 200,
                        width: double.infinity,
                        color: Colors.red,
                      ),
                ElevatedButton(
                    onPressed: () async {
                      final imagen = await getImage();
                      setState(() {
                        imagen_to_upload = File(imagen!.path);
                      });
                    },
                    child: const Text('Seleccionar Comprobante')),
                ElevatedButton(
                    onPressed: () {}, child: const Text('Subir Comprobante')),
              ],
            ),
          ),
        ));
  }
}
