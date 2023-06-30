import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/user.provider.dart';
import '../services/services.dart';
import '../screens/global.colors.dart';

enum Gender { masculino, femenino }

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  Gender? _selectedGender;
  TextEditingController _nombre = TextEditingController();
  TextEditingController paterno = TextEditingController();
  TextEditingController materno = TextEditingController();
  final _genero = TextEditingController();
  TextEditingController nacimiento = TextEditingController();
  TextEditingController curp = TextEditingController();
  TextEditingController rfc = TextEditingController();
  final TextEditingController domicilio = TextEditingController();
  TextEditingController estado = TextEditingController();
  TextEditingController alcaldia = TextEditingController();
  TextEditingController cp = TextEditingController();
  TextEditingController ingreso = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _keyForm = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'Genero': 'Masculino',
      'Estado': 'Estado de Mexico',
      'Alcaldia': 'Benito Juarez'
    };
    return Scaffold(
        body: ListView(
      children: [
        SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15.0),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _keyForm,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Crear una cuenta ',
                          style: TextStyle(
                            color: GlobalColors.mainColor,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Corfirmar datos',
                        style: TextStyle(
                          color: GlobalColors.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _nombre,
                        validator: (String? valor) {
                          if (valor == null || valor.isEmpty) {
                            return 'Nombre vacio';
                          }
                          if (valor.length <= 5) {
                            return 'Nombre demasiado corto';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: 'Nombre',
                            border: OutlineInputBorder(),
                            isDense: false,
                            contentPadding: EdgeInsets.all(10),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Email Input
                      TextFormField(
                        controller: paterno,
                        validator: (String? valor) {
                          if (valor == null || valor.isEmpty) {
                            return 'Nombre vacio';
                          }
                          if (valor.length <= 4) {
                            return 'Apellido demasiado corto';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: 'Apellido Paterno',
                            border: OutlineInputBorder(),
                            isDense: false,
                            contentPadding: EdgeInsets.all(10),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Email Input
                      TextFormField(
                        controller: materno,
                        validator: (String? valor) {
                          if (valor == null || valor.isEmpty) {
                            return 'Nombre vacio';
                          }
                          if (valor.length <= 5) {
                            return 'Apellido demasiado corto';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: 'Apellido Materno',
                            border: OutlineInputBorder(),
                            isDense: false,
                            contentPadding: EdgeInsets.all(10),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                        controller: _genero,
                        maxLength: 1,
                        validator: (String? valor) {
                          if (valor == null || valor.isEmpty) {
                            return 'Campo vacio';
                          }
                          if (valor.length <= 0) {
                            return 'Genero incorrecto';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: false,
                        decoration: const InputDecoration(
                            labelText: 'Genero',
                            helperText: 'M/F',
                            border: OutlineInputBorder(),
                            isDense: false,
                            contentPadding: EdgeInsets.all(10),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Genero',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.w400)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          children: [
                            Radio<Gender>(
                              value: Gender.femenino,
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                            ),
                            Text(
                              'Femenino',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              )),
                            ),
                            Radio<Gender>(
                              value: Gender.masculino,
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                            ),
                            Text(
                              'Masculino',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400)),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: nacimiento,
                        decoration: const InputDecoration(
                            labelText: 'Fecha de Nacimiento',
                            filled: true,
                            prefixIcon: Icon(Icons.calendar_today),
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue))),
                        readOnly: true,
                        onTap: () {
                          _selectDate();
                        },
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      // Email Input

                      // Email Input
                      TextFormField(
                        maxLength: 18,
                        controller: curp,
                        inputFormatters: [],
                        validator: (valor) {
                          String pattern =
                              r"^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$";
                          RegExp regExp = new RegExp(pattern);

                          return regExp.hasMatch(valor ?? '')
                              ? null
                              : 'El CURP no es valido';
                        },
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                            labelText: 'Curp',
                            border: OutlineInputBorder(),
                            isDense: false,
                            contentPadding: EdgeInsets.all(10),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // Email Input
                      TextFormField(
                        maxLength: 13,
                        controller: rfc,
                        validator: (valor) {
                          String pattern =
                              r'^(([ÑA-Z|ña-z|&]{3}|[A-Z|a-z]{4})\d{2}((0[1-9]|1[012])(0[1-9]|1\d|2[0-8])|(0[13456789]|1[012])(29|30)|(0[13578]|1[02])31)(\w{2})([A|a|0-9]{1}))$|^(([ÑA-Z|ña-z|&]{3}|[A-Z|a-z]{4})([02468][048]|[13579][26])0229)(\w{2})([A|a|0-9]{1})$';
                          RegExp regExp = new RegExp(pattern);

                          return regExp.hasMatch(valor ?? '')
                              ? null
                              : 'El RFC no es valido';
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: 'RFC',
                            border: OutlineInputBorder(),
                            isDense: false,
                            contentPadding: EdgeInsets.all(10),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // Email Input
                      TextFormField(
                        controller: domicilio,
                        validator: (valor) {
                          if (valor!.isEmpty) {
                            return 'Domicilio vacio';
                          }
                          if (valor.length < 5 || valor.length > 15) {
                            return 'El domicilio no es valido';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: 'Domicilio',
                            border: OutlineInputBorder(),
                            isDense: false,
                            contentPadding: EdgeInsets.all(10),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Email Input
                      TextFormField(
                        controller: estado,
                        validator: (valor) {
                          if (valor!.isEmpty) {
                            return 'Campo vacio';
                          }
                          if (valor.length < 5 || valor.length > 15) {
                            return 'El estado no es valido';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: 'Estado',
                            border: OutlineInputBorder(),
                            isDense: false,
                            contentPadding: EdgeInsets.all(10),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DropdownButtonFormField<String>(
                          value: 'Estado de Mexico',
                          items: const [
                            DropdownMenuItem(
                                value: 'Estado de Mexico',
                                child: Text('Estado de Mexico')),
                            DropdownMenuItem(
                                value: 'Ciudad de Mexico',
                                child: Text('Ciudad de Mexico')),
                            DropdownMenuItem(
                                value: 'Monterrey', child: Text('Monterrey')),
                            DropdownMenuItem(
                                value: 'Puebla', child: Text('Puebla')),
                          ],
                          onChanged: (value) {
                            print(value);
                            formValues['role'] = value ?? 'Mexico';
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      // Email Input
                      TextFormField(
                        controller: alcaldia,
                        validator: (valor) {
                          if (valor!.isEmpty) {
                            return 'Campo vacio';
                          }
                          if (valor.length < 5 || valor.length > 15) {
                            return 'La alcaldia no es valida';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: 'Alcaldia',
                            border: OutlineInputBorder(),
                            isDense: false,
                            contentPadding: EdgeInsets.all(10),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // Email Input
                      TextFormField(
                        controller: cp,
                        validator: (valor) {
                          String pattern = r'^\d{4,5}$';
                          RegExp regExp = new RegExp(pattern);

                          return regExp.hasMatch(valor ?? '')
                              ? null
                              : 'El RFC no es valido';
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: 'CP',
                            border: OutlineInputBorder(),
                            isDense: false,
                            contentPadding: EdgeInsets.all(10),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Email Input
                      TextFormField(
                        controller: ingreso,
                        validator: (valor) {
                          if (valor!.isEmpty) {
                            return 'Campo vacio';
                          }
                          if (valor.length < 5 || valor.length > 15) {
                            return 'La fecha no es valida';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                            labelText: 'Ingreso',
                            border: OutlineInputBorder(),
                            isDense: false,
                            contentPadding: EdgeInsets.all(10),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      Container(
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.center,
                        child: ElevatedButton(
                            onPressed: () async {
                              Navigator.pushNamed(context, 'PruebaPut');
                              var post = Prospecto(
                                cp: cp.text,
                                rfc: rfc.text,
                                domicilio: domicilio.text,
                                ingreso: ingreso.text,
                                curp: curp.text,
                                estado: estado.text,
                                genero: _genero.text,
                                materno: materno.text,
                                nombre: _nombre.text,
                                paterno: paterno.text,
                                alcaldia: alcaldia.text,
                                email: '1',
                                createdAt: null,
                                nacimiento: null,
                                updatedAt: null,
                              );
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
                            child: const Text(
                              'Crear cuenta',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            )),
                      )
                    ]),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (_picked != null) {
      setState(() {
        nacimiento.text = _picked.toString().split('   ')[0];
      });
    }
  }
}
