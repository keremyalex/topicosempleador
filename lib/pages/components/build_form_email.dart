import 'package:empleador_app/pages/components/custom_surfix_icon.dart';
import 'package:flutter/material.dart';


class BuildFormEmail extends StatelessWidget {
  const BuildFormEmail({
    Key key,
    @required this.controller,
    this.labelText,
    this.hintText,
    this.icono,
    this.onSaved, this.validator,
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
