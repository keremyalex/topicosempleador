import 'package:empleador_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


mostrarAlerta(BuildContext context, String titulo, String subtitulo) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(titulo, style: TextStyle(fontWeight: FontWeight.bold),),
      content: Text(subtitulo),
      actions: <Widget>[
        MaterialButton(
          child: Text('Ok'),
          elevation: 5,
          color: kPrimaryColor,
          onPressed: () => Navigator.pop(context),
        )
      ],
    ),
  );
}
