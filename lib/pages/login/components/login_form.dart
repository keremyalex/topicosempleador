import 'package:empleador_app/constants.dart';
import 'package:empleador_app/pages/components/build_form_email.dart';
import 'package:empleador_app/pages/components/build_form_password.dart';
import 'package:empleador_app/pages/components/custom_surfix_icon.dart';
import 'package:empleador_app/pages/components/default_button.dart';
import 'package:empleador_app/pages/components/social_card.dart';
import 'package:empleador_app/services/trabajador_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relative_scale/relative_scale.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with RelativeScale {
  final _formKey = GlobalKey<FormState>();
  final emailCtrl = new TextEditingController();
  final passwordCtrl = new TextEditingController();
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    initRelativeScaler(context);
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: sx(20.0),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Bienvenido',
                style: TextStyle(
                    fontSize: sy(28),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Muli'),
              ),
              Text(
                "Inicie sesión con su correo y contraseña  \no continue con las redes sociales",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: sy(10),
              ),
              BuildFormEmail(
                controller: emailCtrl,
                labelText: 'Email',
                hintText: 'Ingrese su correo',
                icono: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
                onSaved: (String newValue) => email = newValue,
                validator: (String value) {
                  if (value.isEmpty) {
                    return kEmailNullError;
                  } else if (!emailValidatorRegExp.hasMatch(value)) {
                    return kInvalidEmailError;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: sy(20),
              ),
              BuildFormPassword(
                controller: passwordCtrl,
                labelText: 'Password',
                hintText: 'Ingrese su contraseña',
                icono: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
                onSaved: (String newValue) => password = newValue,
                validator: (String value) {
                  if (value.isEmpty) {
                    return kPassNullError;
                  } else if (value.length < 8) {
                    return kShortPassError;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: sy(10),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "¿Olvidaste tu contraseña?",
                    style: TextStyle(decoration: TextDecoration.underline),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              SizedBox(height: sy(10)),
              DefaultButton(
                text: 'Continue',
                press: () async {
                  print(emailCtrl.text);
                  print(passwordCtrl.text);

                  final trabajadorService =
                      Provider.of<TrabajadorService>(context, listen: false);
                  final trabajadorOk = await trabajadorService.getTrabajadores();

                  //Ruta para probar el login sin datos
                  if(trabajadorOk){
                    Navigator.pushNamedAndRemoveUntil(
                      context, 'home', (route) => false);
                  }
                  

                  // //Los datos son validos de los forms
                  // if (_formKey.currentState.validate()) {
                  //   _formKey.currentState.save();
                  //   // if all are valid then go to success screen

                  // }

                  //Test Api
                  // final areaService =
                  //     Provider.of<AreaService>(context, listen: false);

                  // final areaOk = await areaService.getAreas();

                  // if (areaOk != null) {
                  //   //final subareaOk = await areaService.getSubAreas();
                  //   print('OK API');
                  //   //print('obteniendo: ' + subareaOk.toString());
                  // } else {
                  //   print('Error API');
                  // }

                  // final authService =
                  //     Provider.of<AuthService>(context, listen: false);

                  // final loginOk = await authService.login(
                  //     emailCtrl.text.trim(), passwordCtrl.text.trim());
                  // if (loginOk) {
                  //   Navigator.pushNamedAndRemoveUntil(context, 'ProfilePage', (route) => false);
                  // } else {
                  //   mostrarAlerta(context, 'Estado del Login', 'Error al ingresar');
                  // }
                },
              ),
              SizedBox(
                height: sy(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: "assets/icons/google-icon.svg",
                    press: () {},
                  ),
                  SocialCard(
                    icon: "assets/icons/facebook-2.svg",
                    press: () {},
                  ),
                  SocialCard(
                    icon: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                ],
              ),
              SizedBox(
                height: sy(10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
