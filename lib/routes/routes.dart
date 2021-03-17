import 'package:empleador_app/pages/home/home_page.dart';
import 'package:empleador_app/pages/login/login_page.dart';
import 'package:empleador_app/pages/register/register_page.dart';
import 'package:empleador_app/pages/register_success/register_success.dart';
import 'package:flutter/material.dart';


final Map<String, Widget Function(BuildContext)> routes = {
  'login':            ( _ ) => LoginPage(),
  'register':         ( _ ) => RegisterPage(),
  'home':             ( _ ) => HomePage(),
  'register_success': ( _ ) => RegisterSuccessPage()
};
