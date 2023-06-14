import 'package:flutter/material.dart';
import 'package:flutter_application_2_2/provider/login_from_provider.dart';
import 'package:provider/provider.dart';

import '../utils/global.colors.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
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
                      'Exitus Credit',
                      style: TextStyle(
                        color: GlobalColors.mainColor,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Ingrese a su cuenta',
                    style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // Email Input
                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: TextFormField(),
                  ),
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
                  const SizedBox(
                    height: 10,
                  ),
                  // Password Input
                  TextFormField(
                    controller: contrasena,
                    // onChanged: (valor) => _keyForm,
                    validator: (valor) {
                      return (valor != null && valor.length >= 6)
                          ? null
                          : 'La contrasena debe de ser de 6 caracteres';
                    },
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: '####',
                      labelText: 'Contrasena',
                      border: OutlineInputBorder(),
                      isDense: false,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.red),
                        ),
                        onPressed: () {
                          if (_keyForm.currentState!.validate()) {
                            print('Validacion exitosa');
                          } else {
                            print('Ha ocurrido un error');
                          }
                          Navigator.pushNamed(context, 'HomeScreen');
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
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      height: 50,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('Olvidaste tu contraseña?'),
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, 'ForgotView'),
                            child: InkWell(
                              child: Text(
                                ' Obtener',
                                style: TextStyle(
                                  color: GlobalColors.mainColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
          height: 50,
          color: Colors.white,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('No tienes una cuenta?'),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'AvisoPrivacidad'),
                child: InkWell(
                  child: Text(
                    ' Registrar',
                    style: TextStyle(
                      color: GlobalColors.mainColor,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
