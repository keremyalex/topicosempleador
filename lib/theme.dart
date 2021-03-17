import 'package:empleador_app/constants.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    appBarTheme: appBarTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    primaryColor: kPrimaryColor,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: kPrimaryColor),
    centerTitle: true,
    textTheme: TextTheme(
      headline5: TextStyle(
          color: kPrimaryColor, fontSize: 28, fontWeight: FontWeight.bold),
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(width: 1,color: Colors.black)
  );

  OutlineInputBorder outlineErrorInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(width: 1,color: Colors.red)
  );

  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 20),
    border: InputBorder.none,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    errorBorder: outlineErrorInputBorder,
    focusedErrorBorder: outlineErrorInputBorder
  );
}
