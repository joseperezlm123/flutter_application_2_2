import 'package:flutter/material.dart';

import '../models/user.provider.dart';
import '../services/servides.dart';
import '../utils/global.colors.dart';

class PhoneVerifyPage extends StatelessWidget {
  PhoneVerifyPage({super.key});

  final _keyForm = GlobalKey<FormState>();

  final TextEditingController movil = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _keyForm,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Verificar Telefono',
                      style: TextStyle(
                        color: GlobalColors.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text(
                        'Ingresa tu telefono',
                        style: TextStyle(
                          color: GlobalColors.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Email Input
                  TextFormField(
                    validator: (valor) {
                      String pattern =
                          r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$';
                      RegExp regExp = new RegExp(pattern);

                      return regExp.hasMatch(valor ?? '')
                          ? null
                          : 'El CURP no es valido';
                    },
                    controller: movil,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Telefono',
                      helperText: '+52 xxxx xxxx xx ',
                      border: OutlineInputBorder(),
                      isDense: false,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.blue),
                        ),
                        onPressed: () async {
                          Navigator.pushNamed(context, 'OtpForm');
                          var id = 27;
                          var post =
                              Data(movil: movil.text, cp: null, estado: null);

                          var response = await BaseClient()
                              .put('/pospecto/$id', post.toJson())
                              .catchError((err) {
                            debugPrint(err.toString());
                          });
                          if (response == null) return;
                          debugPrint('succesful');
                          debugPrint(response.toString());
                          if (_keyForm.currentState!.validate()) {
                            print('Validacion exitosa');
                          } else {
                            print('Ha ocurrido un error');
                          }
                          if (_keyForm.currentState!.validate()) {
                            print('Validacion exitosa');
                          } else {
                            print('Ha ocurrido un error');
                          }
                        },
                        child: const Column(
                          children: [
                            Text(
                              'Inicio',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
