import 'package:flutter/material.dart';

class PreguntasRegistro extends StatefulWidget {
  const PreguntasRegistro({super.key});

  @override
  State<PreguntasRegistro> createState() => _PreguntasRegistroState();
}

class _PreguntasRegistroState extends State<PreguntasRegistro> {
  GlobalKey<FormState> keyform = GlobalKey<FormState>();
  bool fueServpub = false;
  bool parServpub = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Form(
            key: keyform,
            child: Column(
              children: [
                SwitchListTile(
                    title: const Text('Fue servidor publico?'),
                    value: fueServpub,
                    onChanged: (bool? value) {
                      if (value != null) {
                        fueServpub = value;
                        setState(() {});
                      }
                    }),
                SwitchListTile(
                    title: const Text(
                        'Tiene algun pariente que fue servidor publido?'),
                    value: parServpub,
                    onChanged: (bool? value) {
                      if (value != null) {
                        parServpub = value;
                        setState(() {});
                      }
                    }),
                MaterialButton(
                  onPressed: () {
                    if (keyform.currentState!.validate()) {
                      Map<String, dynamic> info = {
                        'fueServpub': fueServpub,
                        'parServpub': parServpub
                      };
                      print(info);
                    }
                  },
                  child: const Text('Guardar'),
                )
              ],
            )),
      ),
    );
  }
}
