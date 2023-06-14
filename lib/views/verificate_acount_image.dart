import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2_2/services/select_image.dart';
import 'package:image_picker/image_picker.dart';

class VerificateAcount extends StatefulWidget {
  const VerificateAcount({super.key});

  @override
  State<VerificateAcount> createState() => _VerificateAcountState();
}

class _VerificateAcountState extends State<VerificateAcount> {
  opciones(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      selImage(1);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Tomar una foto',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Icon(
                            Icons.camera_alt,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      selImage(2);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Selecionar una foto',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Icon(
                            Icons.image_outlined,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(color: Colors.red),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Cancelar',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Icon(
                            Icons.cancel_presentation_rounded,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  File? imagen_to_upload;
  final picker = ImagePicker();

  Future selImage(op) async {
    var pickedFile;

    if (op == 1) {
      pickedFile = await picker.getImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    }

    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
      } else {
        print('No seleccionaste una foto');
      }
    });

    Navigator.of(context).pop();
  }

  File? imagen = null;
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
                    'Sube un comprobante de tu domicilio particular actual',
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Puedes usar:'),
                const SizedBox(
                  height: 20,
                ),
                const Text('-Foto de tu INE por enfrente'),
                const SizedBox(
                  height: 20,
                ),
                imagen_to_upload != null
                    ? Image.file(imagen_to_upload!)
                    : Container(
                        margin: const EdgeInsets.all(10),
                        height: 200,
                        width: double.infinity,
                        color: Colors.grey[200],
                      ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final imagen = await getImage();
                      setState(() {
                        imagen_to_upload = File(imagen!.path);
                      });
                    },
                    child: const Text('Seleccionar Comprobante')),
                const SizedBox(
                  height: 20,
                ),
                const Text('-Foto de tu INE por detras'),
                const SizedBox(
                  height: 20,
                ),
                imagen_to_upload != null
                    ? Image.file(imagen_to_upload!)
                    : Container(
                        margin: const EdgeInsets.all(10),
                        height: 200,
                        width: double.infinity,
                        color: Colors.grey[200],
                      ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final imagen = await getImage();
                      setState(() {
                        imagen_to_upload = File(imagen!.path);
                      });
                    },
                    child: const Text('Seleccionar Comprobante')),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Text('Subir Comprobante')),
                ElevatedButton(
                    onPressed: () {
                      opciones(context);
                    },
                    child: Text('Selecciona una imagen')),
                SizedBox(
                  height: 20,
                ),
                imagen == null ? Center() : Image.file(imagen!),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
