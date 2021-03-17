// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    this.id,
    this.name,
    this.lastname,
    this.fecha,
    this.telephone,
    this.genero,
    this.ci,
    this.departamento,
    this.area,
    this.trabajo,
    this.dias,
    this.horario,
    this.email,
    this.profilePhoto,
  });

  int id;
  String name;
  String lastname;
  String fecha;
  int telephone;
  String genero;
  int ci;
  String departamento;
  String area;
  String trabajo;
  String dias;
  String horario;
  String email;
  String profilePhoto;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        fecha: json["fecha"],
        telephone: json["telephone"],
        genero: json["genero"],
        ci: json["ci"],
        departamento: json["departamento"],
        area: json["area"],
        trabajo: json["trabajo"],
        dias: json["dias"],
        horario: json["horario"],
        email: json["email"],
        profilePhoto: json["profile_photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "fecha": fecha,
        "telephone": telephone,
        "genero": genero,
        "ci": ci,
        "departamento": departamento,
        "area": area,
        "trabajo": trabajo,
        "dias": dias,
        "horario": horario,
        "email": email,
        "profile_photo": profilePhoto,
      };
}
