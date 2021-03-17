import 'package:flutter/material.dart';

//const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryColor = Color(0xFF9E3EDD);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF9E3EDD), Color(0xFFB471E0)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);



const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Por favor, ingrese su correo";
const String kInvalidEmailError = "Por favor, ingrese un correo válido";
const String kPassNullError = "Por favor, ingrese su contraseña";
const String kShortPassError = "Su contraseña es muy corta";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Por favor, ingrese su nombre";
const String kLastNamelNullError = "Por favor, ingrese su apellido";
const String kPhoneNumberNullError = "Por favor, ingrese su número de teléfono";
const String kCINullError = "Por favor, ingrese su número de teléfono";
const String kAddressNullError = "Por favor, ingrese su dirección";




