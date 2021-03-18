import 'package:empleador_app/models/trabajador.dart';
import 'package:empleador_app/models/trabajador_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

class TrabajadorService with ChangeNotifier {
  List<Trabajador> trabajadores;

  Future<bool> getTrabajadores() async {
    //final data = {'email': email, 'password': password};

    final resp = await http.get(DotEnv().env['API_TRABAJADORES']);

    if (resp.statusCode == 200) {
      print('Conexión Exitosa Login');
      print(resp.body);
      final trabajadorResponse = trabajadorResponseFromJson(resp.body);
      this.trabajadores = trabajadorResponse.trabajador;

      return true;
    } else {
      print('Error en la conexión login');
      return false;
    }
  }

}
