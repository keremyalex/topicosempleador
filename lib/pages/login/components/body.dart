import 'package:empleador_app/pages/login/components/labels.dart';
import 'package:empleador_app/pages/login/components/login_form.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:relative_scale/relative_scale.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
        builder: (context, screenHeight, screenWidth, sy, sx) {
      return SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset('assets/lotties/27506-search-for-employee.json',
                    height: 200, fit: BoxFit.fill),
            LoginForm(),
            Labels(
                ruta: 'register',
                titulo: '¿No tienes una cuenta?',
                subTitulo: 'Registrate ahora!'),
            SizedBox(height: 20,)
          ],
        ),
      ));
    });
  }
}
