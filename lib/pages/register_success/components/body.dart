import 'package:flutter/material.dart';
import 'package:empleador_app/pages/components/default_button.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: MediaQuery.of(context).size.height * 0.4, //40%
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.08),
        Text(
          "Register Success",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text("Sus datos han sido enviados para su revisión, \n una vez aprobado, inicie sesión con sus credenciales.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
          ),
        Spacer(),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: DefaultButton(
            text: "Back to Login",
            press: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, 'login', (route) => false);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
