import 'package:empleador_app/models/login_response.dart';
import 'package:empleador_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService with ChangeNotifier {
  Usuario usuario;
  bool _autenticando = false;
  final _storage = new FlutterSecureStorage();

  bool get autenticando => this._autenticando;

  set autenticando(bool valor) {
    this._autenticando = valor;
    notifyListeners();
  }

  //Getters del token de forma estatica
  static Future<String> getToken() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  Future<bool> login(String email, String password) async {
    this.autenticando = true;

    final tokenPush = await _storage.read(key: 'tokenPush');
    final tipoUser = 'empleador';

    final data = {
      'email': email,
      'password': password,
      'token': tokenPush,
      'tipoUser': tipoUser
    };

    print(data);

    final resp = await http.post(DotEnv().env['API_LOGIN'], body: data);

    this.autenticando = false;
    if (resp.statusCode == 200) {
      print('Conexión Exitosa Login');
      print(resp.body);
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;
      if (this.usuario.id != null)
        //await this._guardarIdUser(loginResponse.usuario.id.toString());
        return true;
      else
        return false;
    } else {
      print('Error en la conexión login');
      return false;
    }
  }

  Future<bool> register(
      String name,
      String lastname,
      String fecha,
      String telephone,
      String genero,
      String ci,
      String depart,
      String email,
      String password,
      String image,
      String filename) async {
    final tokenPush = await _storage.read(key: 'tokenPush');
    final data = {
      'image': image,
      'filename': filename,
      'name': name,
      'lastname': lastname,
      'fecha': fecha,
      'telephone': telephone,
      'genero': genero,
      'ci': ci,
      'departamento': depart,
      'token': tokenPush,
      'email': email,
      'password': password
    };
    //falta el area de trabajo

    final resp = await http.post(DotEnv().env['API_REGISTER'], body: data);
    print(data['name']);
    print(resp.body);
    if (resp.statusCode == 200) {
      print('Registro Exitoso');
      //Proceder a borrar datos temporales

      await _storage.delete(key: 'base64Image');
      await _storage.delete(key: 'filename');
      await _storage.delete(key: 'nombre');
      await _storage.delete(key: 'apellido');
      await _storage.delete(key: 'fecha');
      await _storage.delete(key: 'telefono');
      await _storage.delete(key: 'genero');
      await _storage.delete(key: 'ci');
      await _storage.delete(key: 'departamento');

      return true;
      //return await login(email, password);
    } else {
      print('Error en la conexión login despues de registro');
      return false;
    }
  }
}
