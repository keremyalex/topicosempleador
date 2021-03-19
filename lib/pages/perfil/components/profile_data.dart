import 'package:empleador_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({
    Key key,
    this.text,
    this.icon,
  }) : super(key: key);

  final String text, icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Color(0xFFF1EFED)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SvgPicture.asset(
                icon,
                width: 22,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ))
          ],
        ),
      ),
    );
  }
}