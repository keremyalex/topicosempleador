import 'package:empleador_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';


class Labels extends StatelessWidget {
  final String ruta;
  final String titulo;
  final String subTitulo;

  const Labels({
    Key key,
    @required this.ruta,
    @required this.titulo,
    @required this.subTitulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
        builder: (context, screenHeight, screenWidth, sy, sx) {
      return Container(
        child: Column(
          children: <Widget>[
            Text(this.titulo,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: sy(14),
                    fontWeight: FontWeight.w300)),
            SizedBox(height: sy(5)),
            GestureDetector(
              child: Text(this.subTitulo,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: sy(15),
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pushNamed(context, this.ruta);
              },
            )
          ],
        ),
      );
    });
  }
}
