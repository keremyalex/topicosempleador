import 'package:empleador_app/pages/register/components/body.dart';
import 'package:empleador_app/pages/register/components/body2.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  PageController _pageController = new PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Registro',
            style: Theme.of(context).appBarTheme.textTheme.headline5,
          ),
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        body: PageView(
          controller: _pageController,
          //physics: NeverScrollableScrollPhysics(), //disable scroll
          children: [            
            Body(pageController: _pageController,), 
            Body2()
          ],
        ));
  }
}
