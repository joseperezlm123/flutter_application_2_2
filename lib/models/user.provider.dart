import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  bool success;
  Data data;
  String message;

  Post({
    required this.success,
    required this.data,
    required this.message,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  String? nombre;
  String? paterno;
  String? materno;
  String? genero;
  DateTime? nacimiento;
  String? email;
  String? movil;
  String? curp;
  dynamic rfc;
  dynamic domicilio;
  String? estado;
  dynamic alcaldia;
  String? cp;
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

  Data({
    this.nombre,
    this.paterno,
    this.materno,
    this.genero,
    this.nacimiento,
    this.email,
    this.movil,
    this.curp,
    this.rfc,
    this.domicilio,
    required this.estado,
    this.alcaldia,
    required this.cp,
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nombre: json["nombre"],
        paterno: json["paterno"],
        materno: json["materno"],
        genero: json["genero"],
        nacimiento: DateTime.parse(json["nacimiento"]),
        email: json["email"],
        movil: json["movil"],
        curp: json["curp"],
        rfc: json["rfc"],
        domicilio: json["domicilio"],
        estado: json["estado"],
        alcaldia: json["alcaldia"],
        cp: json["CP"],
        ifefrente: json["ifefrente"],
        ifetras: json["ifetras"],
        foto: json["foto"],
        ingreso: json["ingreso"],
        ingresoTipo: json["ingreso_tipo"],
        fueServpub: json["fue_servpub"],
        parServpub: json["par_servpub"],
        emailver: json["emailver"],
        movilver: json["movilver"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "paterno": paterno,
        "materno": materno,
        "genero": genero,
        "nacimiento": nacimiento,
        // "${nacimiento.year.toString().padLeft(4, '0')}-${nacimiento.month.toString().padLeft(2, '0')}-${nacimiento.day.toString().padLeft(2, '0')}",
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
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
