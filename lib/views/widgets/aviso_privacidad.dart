import 'package:flutter/material.dart';

import '../../screens/global.colors.dart';

enum AvisoPrivacidadEnum { Canelar, Aceptar }

class AvisoPrivacidad extends StatefulWidget {
  @override
  State<AvisoPrivacidad> createState() => _AvisoPrivacidadState();
}

class _AvisoPrivacidadState extends State<AvisoPrivacidad> {
  AvisoPrivacidadEnum? _avisoPrivacidadEnum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Aviso de Privacidad',
                    style: TextStyle(
                      color: GlobalColors.mainColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    const Center(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: Text(
                          'Para continuar con el proceso de activacion de tu cuenta Exitus es necesario que consultes nuetro Aviso de privacidad',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                'Confirmo que tengo conocimiento del contenido del Aviso de Privacidad',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 25),
                              child: Text(
                                'Consiento que mis datos personales sensibles sean tratados y tranferidos de acuerdo al aviso de privacidad',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                'Confirmo que tengo conocimiento del contenido del Aviso de Privacidad',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                'Confirmo que tengo conocimiento del contenido del Aviso de Privacidad',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RadioListTile<AvisoPrivacidadEnum>(
                                      contentPadding: const EdgeInsets.all(0.0),
                                      value: AvisoPrivacidadEnum.Canelar,
                                      groupValue: _avisoPrivacidadEnum,
                                      tileColor: Colors.deepPurple.shade50,
                                      title: Text(
                                          AvisoPrivacidadEnum.Canelar.name),
                                      onChanged: (val) {
                                        setState(() {
                                          _avisoPrivacidadEnum = val;
                                        });
                                      }),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: RadioListTile<AvisoPrivacidadEnum>(
                                      contentPadding: const EdgeInsets.all(0.0),
                                      value: AvisoPrivacidadEnum.Aceptar,
                                      groupValue: _avisoPrivacidadEnum,
                                      tileColor: Colors.deepPurple.shade50,
                                      title: Text(
                                          AvisoPrivacidadEnum.Aceptar.name),
                                      onChanged: (val) {
                                        setState(() {
                                          _avisoPrivacidadEnum = val;
                                        });
                                      }),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                'Confirmo que tengo conocimiento del contenido del Aviso de Privacidad',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                'Confirmo que tengo conocimiento del contenido del Aviso de Privacidad',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                'Confirmo que tengo conocimiento del contenido del Aviso de Privacidad',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                'Confirmo que tengo conocimiento del contenido del Aviso de Privacidad',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                'Confirmo que tengo conocimiento del contenido del Aviso de Privacidad',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                'Confirmo que tengo conocimiento del contenido del Aviso de Privacidad',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.red)),
                        onPressed: () {
                          Navigator.pushNamed(context, 'RegisterView');
                        },
                        child: const Text("Confirmar"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
