import 'package:empleador_app/models/area.dart';
import 'package:empleador_app/models/area_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;


class AreaService with ChangeNotifier {
  List<Area> areas;

  Future<List<String>> getAreas() async {
    //final data = {'email': email, 'password': password};

    final resp =
        await http.get(DotEnv().env['API_AREAS']);

    if (resp.statusCode == 200) {
      print('Conexión Exitosa Login');
      //print(resp.body);
      final areaResponse = areaResponseFromJson(resp.body);
      this.areas = areaResponse.area;
      List<String> listAreas = new List();
      areas.forEach((e) {
        listAreas.add(e.descripcion);
      });
      print(listAreas);

      return listAreas;
    } else {
      print('Error en la conexión login');
    }
  }

  Future<List<String>> getSubAreas(var area) async {
    final resp =
        await http.get(DotEnv().env['API_AREAS']);

    if (resp.statusCode == 200) {
      print('Conexión Exitosa Login');
      //print(resp.body);
      final areaResponse = areaResponseFromJson(resp.body);
      this.areas = areaResponse.area;

      List<String> listSubAreas = new List();

      areas.forEach((e) {
        //if(e.description == areaporParametro)
        if (e.descripcion == area) {
          e.subAreas.forEach((element) {
            listSubAreas.add(element.descripcion);
          });
        }
      });
      print(listSubAreas);
      return listSubAreas;
    }
  }

  Future<String> getIDSubAreas(String suba) async {
    String idSub = '';
    final resp =
        await http.get(DotEnv().env['API_AREAS']);

    if (resp.statusCode == 200) {
      print('Conexión Exitosa Login');
      //print(resp.body);
      final areaResponse = areaResponseFromJson(resp.body);
      this.areas = areaResponse.area;

      areas.forEach((e) {
        //if(e.description == areaporParametro)
        e.subAreas.forEach((element) {
          if (element.descripcion == suba) {
            idSub = element.id.toString();
          }
        });
      });
      return idSub;
    }
  }
}
