import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../services/user.provider.dart';

class VerificateAcount extends StatefulWidget {
  const VerificateAcount({super.key});

  // TextEditingController ifefrente = TextEditingController();
  @override
  State<VerificateAcount> createState() => _VerificateAcountState();
}

class _VerificateAcountState extends State<VerificateAcount> {
  // TextEditingController ifefrente = TextEditingController();
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
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
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

  Dio dio = new Dio();

  Future<dynamic> buscarProspecto() async {
    final response = await http.get(
      Uri.parse('http://idemo.brave.com.mx/api/pospecto/75'),
    );
    if (response.statusCode == 200) {
      return Prospecto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Prospecto');
    }
  }

  Future<void> subir_imagen() async {
    try {
      String filename = imagen!.path.split('/').last;

      FormData formData = new FormData.fromMap({
        'file': await MultipartFile.fromFile(imagen!.path, filename: filename)
      });

      await dio
          .put('http://idemo.brave.com.mx/api/pospecto/27', data: formData)
          .then((value) {
        if (value.toString() == '1') {
          print('La foto se subio correctamente');
        } else {
          print('Hubo un error');
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  final _keyForm = GlobalKey<FormState>();
  TextEditingController ifefrente = TextEditingController();
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
          child: Form(
            key: _keyForm,
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
                imagen == null ? const Center() : Image.file(imagen!),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      opciones(context);
                    },
                    child: const Text(
                      'Selecciona una imagen',
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {},
                    child: const Text(
                      'Subir Imagen',
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
