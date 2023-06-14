import 'package:flutter/material.dart';

import '../utils/global.colors.dart';

class VerifyPage extends StatelessWidget {
  VerifyPage({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController contrasena = TextEditingController();

  final _keyForm = GlobalKey<FormState>();
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
                      'Verificar Correo',
                      style: TextStyle(
                        color: GlobalColors.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text(
                        'Ingresa tu correo electronico',
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
                    controller: email,
                    validator: (valor) {
                      String pattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regExp = new RegExp(pattern);

                      return regExp.hasMatch(valor ?? '')
                          ? null
                          : 'El correo no es correcto';
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      helperText: 'correo@correo.com',
                      border: OutlineInputBorder(),
                      isDense: false,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.red),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'EmailForm');

                          if (_keyForm.currentState!.validate()) {
                            print('Validacion exitosa');
                          } else {
                            print('Ha ocurrido un error');
                          }
                          // Navigator.pushNamed(context, 'HomeScreen');
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
