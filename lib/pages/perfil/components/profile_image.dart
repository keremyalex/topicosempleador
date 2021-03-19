import 'package:empleador_app/constants.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key key,
    this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: CircleAvatar(
          radius: 95,
          backgroundColor: kPrimaryColor,
          child: ClipOval(
            child: SizedBox(
              width: 180.0,
              height: 180.0,
              child: image!=null?
              Image.network(image, fit: BoxFit.fill,):
              Image.asset('assets/images/avatar.png', fit: BoxFit.fill,)
            ),
          ),
        ),
      ),
    );
  }
}
