

import 'dart:convert';

import 'package:empleador_app/models/trabajador.dart';

TrabajadorResponse trabajadorResponseFromJson(String str) => TrabajadorResponse.fromJson(json.decode(str));

String trabajadorResponseToJson(TrabajadorResponse data) => json.encode(data.toJson());

class TrabajadorResponse {
    TrabajadorResponse({
        this.trabajador,
    });

    List<Trabajador> trabajador;

    factory TrabajadorResponse.fromJson(Map<String, dynamic> json) => TrabajadorResponse(
        trabajador: List<Trabajador>.from(json["trabajador"].map((x) => Trabajador.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "trabajador": List<dynamic>.from(trabajador.map((x) => x.toJson())),
    };
}

