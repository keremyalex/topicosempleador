// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import 'package:empleador_app/models/usuario.dart';



LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.usuario,
  });

  Usuario usuario;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        usuario: Usuario.fromJson(json["usuario"]),
      );

  Map<String, dynamic> toJson() => {
        "usuario": usuario.toJson(),
      };
}
