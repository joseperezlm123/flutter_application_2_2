import 'package:flutter/material.dart';

enum AvisoPrivacidadEnum { Canelar, Aceptar }

enum AvisoPrivacidadEnumSiNo { Si, No }

class PreguntasRegistro extends StatefulWidget {
  const PreguntasRegistro({super.key});

  @override
  State<PreguntasRegistro> createState() => _PreguntasRegistroState();
}

class _PreguntasRegistroState extends State<PreguntasRegistro> {
  AvisoPrivacidadEnum? _avisoPrivacidadEnum;
  AvisoPrivacidadEnumSiNo? _avisoPrivacidadEnumSiNo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Aviso de Privacidad',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Para continuar con el proceso de activacion de tu cuenta es necesario que consultes nuestros Aviso de Privacidad',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
            const Text(
              'Consiento que mis datos personales y personales sensibles sean tratados y transferidos de acuerdo al aviso de privacidad',
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<AvisoPrivacidadEnumSiNo>(
                      contentPadding: const EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      value: AvisoPrivacidadEnumSiNo.Si,
                      groupValue: _avisoPrivacidadEnumSiNo,
                      dense: true,
                      tileColor: Colors.deepPurple.shade50,
                      title: Text(AvisoPrivacidadEnumSiNo.Si.name),
                      onChanged: (val) {
                        // Navigator.pop(context);
                        setState(() {
                          _avisoPrivacidadEnumSiNo = val;
                        });
                      }),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Expanded(
                  child: RadioListTile<AvisoPrivacidadEnumSiNo>(
                      contentPadding: const EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      value: AvisoPrivacidadEnumSiNo.No,
                      groupValue: _avisoPrivacidadEnumSiNo,
                      dense: true,
                      tileColor: Colors.deepPurple.shade50,
                      title: Text(AvisoPrivacidadEnumSiNo.No.name),
                      onChanged: (val) {
                        // Navigator.pop(context);
                        setState(() {
                          _avisoPrivacidadEnumSiNo = val;
                        });
                      }),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Consiento que mis datos personales y personales sensibles sean tratados y transferidos de acuerdo al aviso de privacidad',
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<AvisoPrivacidadEnumSiNo>(
                      contentPadding: const EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      value: AvisoPrivacidadEnumSiNo.Si,
                      groupValue: _avisoPrivacidadEnumSiNo,
                      dense: true,
                      tileColor: Colors.deepPurple.shade50,
                      title: Text(AvisoPrivacidadEnumSiNo.Si.name),
                      onChanged: (val) {
                        // Navigator.pop(context);
                        setState(() {
                          _avisoPrivacidadEnumSiNo = val;
                        });
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: RadioListTile<AvisoPrivacidadEnumSiNo>(
                      contentPadding: const EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      value: AvisoPrivacidadEnumSiNo.No,
                      groupValue: _avisoPrivacidadEnumSiNo,
                      dense: true,
                      tileColor: Colors.deepPurple.shade50,
                      title: Text(AvisoPrivacidadEnumSiNo.No.name),
                      onChanged: (val) {
                        // Navigator.pop(context);
                        setState(() {
                          _avisoPrivacidadEnumSiNo = val;
                        });
                      }),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Consiento que mis datos personales y personales sensibles sean tratados y transferidos de acuerdo al aviso de privacidad',
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<AvisoPrivacidadEnumSiNo>(
                      contentPadding: const EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      value: AvisoPrivacidadEnumSiNo.Si,
                      groupValue: _avisoPrivacidadEnumSiNo,
                      dense: true,
                      tileColor: Colors.deepPurple.shade50,
                      title: Text(AvisoPrivacidadEnumSiNo.Si.name),
                      onChanged: (val) {
                        // Navigator.pop(context);
                        setState(() {
                          _avisoPrivacidadEnumSiNo = val;
                        });
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: RadioListTile<AvisoPrivacidadEnumSiNo>(
                      contentPadding: const EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      value: AvisoPrivacidadEnumSiNo.No,
                      groupValue: _avisoPrivacidadEnumSiNo,
                      dense: true,
                      tileColor: Colors.deepPurple.shade50,
                      title: Text(AvisoPrivacidadEnumSiNo.No.name),
                      onChanged: (val) {
                        // Navigator.pop(context);
                        setState(() {
                          _avisoPrivacidadEnumSiNo = val;
                        });
                      }),
                ),
              ],
            ),
            const SizedBox(
              height: 25.0,
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<AvisoPrivacidadEnum>(
                      contentPadding: const EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      value: AvisoPrivacidadEnum.Canelar,
                      groupValue: _avisoPrivacidadEnum,
                      dense: true,
                      tileColor: Colors.deepPurple.shade50,
                      title: Text(AvisoPrivacidadEnum.Canelar.name),
                      onChanged: (val) {
                        // Navigator.pop(context);
                        setState(() {
                          _avisoPrivacidadEnum = val;
                        });
                      }),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Expanded(
                  child: RadioListTile<AvisoPrivacidadEnum>(
                      contentPadding: const EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      value: AvisoPrivacidadEnum.Aceptar,
                      groupValue: _avisoPrivacidadEnum,
                      dense: true,
                      tileColor: Colors.deepPurple.shade50,
                      title: Text(AvisoPrivacidadEnum.Aceptar.name),
                      onChanged: (val) {
                        Navigator.pushNamed(context, 'LoginView');
                        setState(() {
                          _avisoPrivacidadEnum = val;
                        });
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
