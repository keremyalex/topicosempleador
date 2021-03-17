import 'package:empleador_app/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Wrap(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '¿Qué desea buscar?',
                    suffixIcon: Icon(Icons.search, color: kPrimaryColor,),
                  ),
                ),
              ),
              IconButton(icon: Icon(Icons.filter_list), onPressed: (){})
            ],
          ),
        )
      ],
    );
  }
}
