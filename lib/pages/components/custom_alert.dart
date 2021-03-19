import 'package:empleador_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

customAlert(
    BuildContext context, String titulo, String subtitulo, Function ontap) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      content: Container(
        width: 260.0,
        height: 290.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: const Color(0xFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // dialog top
            Container(
              // padding:  EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                titulo,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                    //fontFamily: 'helvetica_neue_light',
                    ),
                textAlign: TextAlign.center,
              ),
            ),

            Text(subtitulo),
            SizedBox(
              height: 10,
            ),

            // dialog centre
            Container(
                child: TextField(
              maxLines: 5,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: false,
                contentPadding: EdgeInsets.only(
                    left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
                hintText: ' Agregar indicaciones..',
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 12.0,
                  //fontFamily: 'helvetica_neue_light',
                ),
              ),
            )),
            SizedBox(
              height: 20,
            ),

            // dialog bottom
            InkWell(
              onTap: ontap,
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    'Solicitar',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                        //fontFamily: 'helvetica_neue_light',
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
