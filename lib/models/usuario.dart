// // To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    Usuario({
        this.id,
        this.photo,
        this.nombre,
        this.apellido,
        this.email,
        this.fechaNacimiento,
        this.genero,
        this.contato,
        this.departamento,
        this.mensaje,
        this.login,
    });

    int id;
    String photo;
    String nombre;
    String apellido;
    String email;
    String fechaNacimiento;
    String genero;
    String contato;
    String departamento;
    String mensaje;
    String login;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        photo: json["photo"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        email: json["email"],
        fechaNacimiento: json["fechaNacimiento"],
        genero: json["genero"],
        contato: json["contato"],
        departamento: json["departamento"],
        mensaje: json["mensaje"],
        login: json["login"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "photo": photo,
        "nombre": nombre,
        "apellido": apellido,
        "email": email,
        "fechaNacimiento": fechaNacimiento,
        "genero": genero,
        "contato": contato,
        "departamento": departamento,
        "mensaje": mensaje,
        "login": login,
    };
}
