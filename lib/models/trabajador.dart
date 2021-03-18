// 

// To parse this JSON data, do
//
//     final trabajador = trabajadorFromJson(jsonString);

import 'dart:convert';

Trabajador trabajadorFromJson(String str) => Trabajador.fromJson(json.decode(str));

String trabajadorToJson(Trabajador data) => json.encode(data.toJson());

class Trabajador {
    Trabajador({
        this.nombreServicio,
        this.nombreArea,
        this.nota,
        this.hora,
        this.dias,
        this.precioEstandar,
        this.nombreTrabajador,
        this.apellidoTrabajador,
        this.departamento,
        this.idServicio,
        this.listaServicio,
    });

    String nombreServicio;
    String nombreArea;
    String nota;
    String hora;
    String dias;
    String precioEstandar;
    String nombreTrabajador;
    String apellidoTrabajador;
    String departamento;
    int idServicio;
    bool listaServicio;

    factory Trabajador.fromJson(Map<String, dynamic> json) => Trabajador(
        nombreServicio: json["nombreServicio"],
        nombreArea: json["nombreArea"],
        nota: json["nota"],
        hora: json["hora"],
        dias: json["dias"],
        precioEstandar: json["precioEstandar"],
        nombreTrabajador: json["nombreTrabajador"],
        apellidoTrabajador: json["apellidoTrabajador"],
        departamento: json["departamento"],
        idServicio: json["idServicio"],
        listaServicio: json["listaServicio"],
    );

    Map<String, dynamic> toJson() => {
        "nombreServicio": nombreServicio,
        "nombreArea": nombreArea,
        "nota": nota,
        "hora": hora,
        "dias": dias,
        "precioEstandar": precioEstandar,
        "nombreTrabajador": nombreTrabajador,
        "apellidoTrabajador": apellidoTrabajador,
        "departamento": departamento,
        "idServicio": idServicio,
        "listaServicio": listaServicio,
    };
}
