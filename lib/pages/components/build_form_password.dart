import 'package:empleador_app/pages/components/custom_surfix_icon.dart';
import 'package:flutter/material.dart';


class BuildFormPassword extends StatelessWidget {
  const BuildFormPassword({
    Key key,
    @required this.controller, this.labelText, this.hintText, this.icono, this.validator, this.onSaved,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText, hintText;
  final CustomSurffixIcon icono;
  final Function onSaved;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          suffixIcon: icono,
          floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onSaved: onSaved,
      validator: validator
    );
  }
}