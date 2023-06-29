import 'package:flutter/material.dart';
import 'package:flutter_application_2_2/services/user.provider.dart';

import '../screens/global.colors.dart';
import '../services/services.dart';

class VerifyPage extends StatelessWidget {
  VerifyPage({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController nombre = TextEditingController();
  final TextEditingController paterno = TextEditingController();

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
                  GestureDetector(
                    onTap: () async {
                      //Navigator.pushNamed(context, 'OtpForm');
                    },
                    child: TextFormField(
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
                  ),
                  Center(
                    child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.red),
                        ),
                        //Navigator.pushNamed(context, 'EmailForm');
                        onPressed: () async {
                          var id = 61;
                          var reponse = await BaseClient()
                              .get('/61')
                              .catchError((err) {});
                          if (reponse == null) return;
                          debugPrint('successfull: ');
                          var user =
                              Prospecto(email: email.text, nombre: 'Jorge');
                          var response = await BaseClient()
                              .put('/$id', user)
                              .catchError((err) {});
                          if (response == null) return;
                          debugPrint('Succesful :');
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
                  // AppButton(
                  //   operation: 'GET',
                  //   operationColor: Colors.green,
                  //   description: 'Nombres',
                  //   onPressed: () async {
                  //     var response =
                  //         await BaseClient().get('/').catchError((err) {});
                  //     if (response == null) return;
                  //     debugPrint('successful');

                  //     var users = postFromJson(response);
                  //     debugPrint('Users count :' + users.toString());
                  //   },
                  // ),
                  // AppButton(
                  //   operation: 'PUT',
                  //   operationColor: Colors.black,
                  //   description: 'Editar usuario',
                  //   onPressed: () async {
                  //     var id = 1;
                  //     var put = Data(
                  //       nombre: 'Juan',
                  //       updatedAt: null,
                  //     );
                  //     var response = await BaseClient()
                  //         .put('/$id', put)
                  //         .catchError((err) {});
                  //     if (response == null) return;
                  //     debugPrint('successful: ');
                  //   },
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
