import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2_2/services/user.provider.dart';

import '../screens/global.colors.dart';

class PhoneVerifyPage extends StatefulWidget {
  PhoneVerifyPage({super.key});

  @override
  State<PhoneVerifyPage> createState() => _PhoneVerifyPageState();
}

class _PhoneVerifyPageState extends State<PhoneVerifyPage> {
  Prospecto? informacion;

  @override
  void initState() {
    super.initState();
    getPrueba();
  }

  Future<void> getPrueba() async {
    final response =
        await Dio().get('http://idemo.brave.com.mx/api/pospecto/5');
    informacion = Prospecto.fromJson(response.data);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _keyForm = GlobalKey<FormState>();

    TextEditingController movil = TextEditingController();

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
                  Text(informacion?.movil ?? 'No data'),
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
                          : 'El Telefono no es valido';
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
                    child: Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.blue),
                          ),
                          onPressed: () {},
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
