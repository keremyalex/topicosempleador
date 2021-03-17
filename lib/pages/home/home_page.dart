import 'package:empleador_app/pages/home/components/body.dart';
import 'package:empleador_app/pages/home/components/menu_lateral.dart';
import 'package:empleador_app/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bienvenido',
          style: theme().appBarTheme.textTheme.headline5,
        ),
      ),
      drawer: MenuLateral(),
      body: Body(),
    );
  }
}


