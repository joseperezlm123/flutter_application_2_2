import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2_2/models/user.provider.dart';

import '../services/servides.dart';

class EmailForm extends StatelessWidget {
  EmailForm({super.key});

  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        key: _keyForm,
        children: [
          Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Text('Ingresa la combinacion que mandamos a tu correo '),
              Form(
                child: SizedBox(
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (pin1) {},
                          decoration: const InputDecoration(hintText: '0'),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          onSaved: (pin2) {},
                          decoration: const InputDecoration(hintText: '0'),
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          onSaved: (pin3) {},
                          decoration: const InputDecoration(hintText: '0'),
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          onSaved: (pin4) {},
                          decoration: const InputDecoration(hintText: '0'),
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    //Navigator.pushNamed(context, 'VerificateAcount');
                    var post = Data(estado: null, cp: null);
                    var response = await BaseClient()
                        .post('', post.toJson())
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
                  },
                  child: Text('Validar'))
            ],
          ),
        ],
      ),
    );
  }
}
