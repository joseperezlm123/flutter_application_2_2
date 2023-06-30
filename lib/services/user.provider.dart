// To parse this JSON data, do
//
//     final prospecto = prospectoFromJson(jsonString);

import 'dart:convert';

Prospecto prospectoFromJson(String str) => Prospecto.fromJson(json.decode(str));

String prospectoToJson(Prospecto data) => json.encode(data.toJson());

class Prospecto {
  String nombre;
  dynamic paterno;
  dynamic materno;
  dynamic genero;
  dynamic nacimiento;
  dynamic email;
  dynamic movil;
  dynamic curp;
  dynamic rfc;
  dynamic domicilio;
  dynamic estado;
  dynamic alcaldia;
  dynamic cp;
  dynamic ifefrente;
  dynamic ifetras;
  dynamic foto;
  dynamic ingreso;
  dynamic ingresoTipo;
  dynamic fueServpub;
  dynamic parServpub;
  dynamic emailver;
  dynamic movilver;
  DateTime? createdAt;
  DateTime? updatedAt;

  var length;

  Prospecto({
    required this.nombre,
    this.paterno,
    this.materno,
    this.genero,
    this.nacimiento,
    this.email,
    this.movil,
    this.curp,
    this.rfc,
    this.domicilio,
    this.estado,
    this.alcaldia,
    this.cp,
    this.ifefrente,
    this.ifetras,
    this.foto,
    this.ingreso,
    this.ingresoTipo,
    this.fueServpub,
    this.parServpub,
    this.emailver,
    this.movilver,
    this.createdAt,
    this.updatedAt,
  });

  factory Prospecto.fromJson(Map<String, dynamic> json) => Prospecto(
        nombre: 'nombre',
        paterno: json["paterno"],
        materno: json["materno"],
        genero: json["genero"],
        nacimiento: json["nacimiento"],
        email: 'email',
        movil: 'movil',
        curp: json["curp"],
        rfc: json["rfc"],
        domicilio: json["domicilio"],
        estado: json["estado"],
        alcaldia: json["alcaldia"],
        cp: json["CP"],
        ifefrente: 'ifefrente',
        ifetras: json["ifetras"],
        foto: json["foto"],
        ingreso: json["ingreso"],
        ingresoTipo: json["ingreso_tipo"],
        fueServpub: json["fue_servpub"],
        parServpub: json["par_servpub"],
        emailver: json["emailver"],
        movilver: json["movilver"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "paterno": paterno,
        "materno": materno,
        "genero": genero,
        "nacimiento": nacimiento,
        "email": email,
        "movil": movil,
        "curp": curp,
        "rfc": rfc,
        "domicilio": domicilio,
        "estado": estado,
        "alcaldia": alcaldia,
        "CP": cp,
        "ifefrente": ifefrente,
        "ifetras": ifetras,
        "foto": foto,
        "ingreso": ingreso,
        "ingreso_tipo": ingresoTipo,
        "fue_servpub": fueServpub,
        "par_servpub": parServpub,
        "emailver": emailver,
        "movilver": movilver,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
