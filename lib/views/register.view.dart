import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/user.provider.dart';
import '../services/servides.dart';
import '../utils/global.colors.dart';

enum Gender { masculino, femenino }

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController _nombre = TextEditingController();
  TextEditingController paterno = TextEditingController();
  TextEditingController materno = TextEditingController();
  final _genero = TextEditingController();
  TextEditingController nacimiento = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController movil = TextEditingController();
  TextEditingController curp = TextEditingController();
  TextEditingController rfc = TextEditingController();
  TextEditingController domicilio = TextEditingController();
  //TextEditingController confirmcontrasena = TextEditingController();
  // TextEditingController contrasena = TextEditingController();
  TextEditingController estado = TextEditingController();
  TextEditingController alcaldia = TextEditingController();
  TextEditingController cp = TextEditingController();
  TextEditingController ingreso = TextEditingController();
  //TextEditingController ingresoTipo = TextEditingController();
  // TextEditingController fueSerPub = TextEditingController();
  // TextEditingController parSerpub = TextEditingController();
  // TextEditingController emailver = TextEditingController();
  // TextEditingController ifefrente = TextEditingController();

  Gender? _selectedGender;

  //  late int sex, genero;

  //    try {
  //     if (_selectedGender == null) {
  //       SnackBar snackBar = const SnackBar(
  //         content: Text("Selecciona algun genero"),
  //         duration: Duration(seconds: 2),
  //       );
  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //       return;
  //     } else if (_selectedGender == Gender.femenino) {
  //       sex = 0;
  //     } else {
  //       sex = 1;
  //     }
  //       genero = int.parse(_nombre.text);
  //      } catch (e) {
  //     print(e.toString());
  //     SnackBar snackBar = const SnackBar(
  //       content: Text("Error!"),
  //       duration: Duration(seconds: 2),
  //     );
  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);

  //     return;
  //   }

  @override
  Widget build(BuildContext context) {
    final _keyForm = GlobalKey<FormState>();

    //DateTime _dateTime = DateTime.now();

    //  final Map<String, String> formValues= {
    //    'genero': 'genero'
    //  };

    void _showDatePicker() {
      showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2025));
    }

    return Scaffold(
        body: ListView(
      children: [
        SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15.0),
              child: Form(
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
                        // onChanged: (value) {
                        //   setState(() {
                        //     nombre.text = value.toString();
                        //   });
                        // },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: 'Nombre',
                          border: OutlineInputBorder(),
                          isDense: false,
                          contentPadding: EdgeInsets.all(10),
                        ),
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
                          if (valor.length <= 5) {
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
                        ),
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
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(),
                      //   child: DropdownButtonFormField(
                      //     value: _selectedVal,
                      //     items: _productDizesList
                      //         .map(
                      //           (e) => DropdownMenuItem(
                      //             child: Text(e),
                      //             value: e,
                      //           ),
                      //         )
                      //         .toList(),
                      //     onChanged: (val) {
                      //       setState(() {
                      //         _selectedVal = val as String;
                      //       });
                      //     },
                      //     icon: const Icon(
                      //       Icons.arrow_drop_down_circle,
                      //       color: Colors.purple,
                      //     ),
                      //     dropdownColor: Colors.deepPurple.shade50,
                      //     decoration: const InputDecoration(
                      //       labelText: 'Masculino',
                      //       prefixIcon: Icon(
                      //         Icons.accessibility_new_rounded,
                      //         color: Colors.purple,
                      //       ),
                      //       border: OutlineInputBorder(),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // DropdownButtonFormField<String>(
                      //     items: const [
                      //         DropdownMenuItem(value: 'genero', child: Text('genero')),
                      //         DropdownMenuItem(value: 'genero', child: Text('genero')),
                      //   ], onChanged: (value) {
                      //     print(value);
                      //     formValues['genero'] = value ?? 'genero';
                      //    }),

                      // const SizedBox(
                      //   height: 15,
                      // ),
                      // Email Input
                      // TextFormField(
                      //   controller: contrasena,
                      //   validator: (valor) {
                      //     if (valor!.isEmpty) {
                      //       return 'Contraseña vacio';
                      //     }
                      //     if (valor.length < 5 || valor.length > 15) {
                      //       return 'Campo vacio';
                      //     }
                      //     return null;
                      //   },
                      //   keyboardType: TextInputType.visiblePassword,
                      //   obscureText: true,
                      //   decoration: const InputDecoration(
                      //     labelText: 'Contraseña',
                      //     border: OutlineInputBorder(),
                      //     isDense: false,
                      //     contentPadding: EdgeInsets.all(10),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      // Email Input
                      TextFormField(
                        controller: _genero,
                        validator: (String? valor) {
                          if (valor == null || valor.isEmpty) {
                            return 'Campo vacio';
                          }
                          if (valor.length <= 5) {
                            return 'Genero incorrecto';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: false,
                        decoration: const InputDecoration(
                          labelText: 'Genero',
                          helperText: 'Masculino/Femenino',
                          border: OutlineInputBorder(),
                          isDense: false,
                          contentPadding: EdgeInsets.all(10),
                        ),
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
                        height: 5,
                      ),
                      // // Email Input
                      TextFormField(
                        controller: nacimiento,
                        validator: (String? valor) {
                          if (valor == null || valor.isEmpty) {
                            return 'Nombre vacio';
                          }
                          if (valor.length <= 5) {
                            return 'Nombre demasiado corto';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                          labelText: 'Fecha De Nacimiento',
                          helperText: 'DD / MM / AAAA',
                          border: OutlineInputBorder(),
                          isDense: false,
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
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
                      const SizedBox(
                        height: 5,
                      ),
                      // Email Input

                      // Email Input
                      TextFormField(
                        controller: curp,
                        validator: (String? valor) {
                          if (valor == null || valor.isEmpty) {
                            return 'Nombre vacio';
                          }
                          if (valor.length <= 14) {
                            return 'Nombre demasiado corto';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          labelText: 'Curp',
                          border: OutlineInputBorder(),
                          isDense: false,
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Email Input
                      TextFormField(
                        controller: rfc,
                        validator: (valor) {
                          if (valor!.isEmpty) {
                            return 'RFC vacio';
                          }
                          if (valor.length < 5 || valor.length > 15) {
                            return 'RFC no es valido';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: 'RFC',
                          border: OutlineInputBorder(),
                          isDense: false,
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
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
                        ),
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
                        ),
                      ),
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
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // Email Input
                      TextFormField(
                        controller: cp,
                        validator: (valor) {
                          if (valor!.isEmpty) {
                            return 'Campo vacio';
                          }
                          if (valor.length < 5 || valor.length > 15) {
                            return 'El codigo postal no es valido';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: 'CP',
                          border: OutlineInputBorder(),
                          isDense: false,
                          contentPadding: EdgeInsets.all(10),
                        ),
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
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // TextFormField(
                      //   controller: ingresoTipo,
                      //   validator: (valor) {
                      //     if (valor!.isEmpty) {
                      //       return 'Campo vacio';
                      //     }
                      //     if (valor.length < 5 || valor.length > 15) {
                      //       return 'La fecha no es valida';
                      //     }
                      //     return null;
                      //   },
                      //   keyboardType: TextInputType.text,
                      //   decoration: const InputDecoration(
                      //     labelText: 'Ingreso Tipo',
                      //     border: OutlineInputBorder(),
                      //     isDense: false,
                      //     contentPadding: EdgeInsets.all(10),
                      //   ),
                      // ),
                      // SwitchListTile(
                      //     title: const Text('Fue servidor publico?'),
                      //     value: fueserpub,
                      //     onChanged: (bool? value) {
                      //       if (value != null) {
                      //         fueserpub = value;
                      //         setState(() {});
                      //       }
                      //     }),
                      // SwitchListTile(
                      //     title: const Text(
                      //         'Tiene algun pariente que fue servidor publico?'),
                      //     value: parserpub,
                      //     onChanged: (bool? value) {
                      //       if (value != null) {
                      //         parserpub = value;
                      //         setState(() {});
                      //       }
                      //     }),

                      Container(
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.center,
                        child: ElevatedButton(
                            onPressed: () async {
                              Navigator.pushNamed(context, 'PhoneVerifyPage');
                              var post = Data(
                                  cp: cp.text,
                                  rfc: rfc.text,
                                  domicilio: domicilio.text,
                                  // ingreso: ingreso.text,
                                  curp: curp.text,
                                  //  email: email.text,
                                  estado: estado.text,
                                  genero: _genero.text,
                                  materno: materno.text,
                                  // movil: movil.text,
                                  nombre: _nombre.text,
                                  paterno: paterno.text,
                                  // alcaldia: alcaldia.text,
                                  createdAt: null,
                                  nacimiento: null,
                                  updatedAt: null);
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
}
