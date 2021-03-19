import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

class SolicitudService with ChangeNotifier {
  //List<Trabajador> trabajadores;

  Future<bool> crearSolicitud(
      String latitud,
      String longitud,
      String fechaSolicitud,
      String horaSolicitud,
      String idServicio,
      String idEmpleador) async {
    final data = {
      'latitud': latitud,
      'longitud': longitud,
      'fechaSolicitud': fechaSolicitud,
      'horaSolicitud': horaSolicitud,
      'idServicio': idServicio,
      'idEmpleador': idEmpleador
    };

    print(data);

    final resp = await http.post(DotEnv().env['API_SOLICITUD'], body: data);

    if (resp.statusCode == 200) {
      print('Conexión Exitosa Login');
      print(resp.body);
      // final trabajadorResponse = trabajadorResponseFromJson(resp.body);
      // this.trabajadores = trabajadorResponse.trabajador;

      return true;
    } else {
      print('Error en la conexión solicitud');
      return false;
    }
  }
}
