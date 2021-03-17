import 'package:empleador_app/constants.dart';
import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Flutter Test"),
            accountEmail: Text("test@test.com"),
            decoration: BoxDecoration(gradient: kPrimaryGradientColor),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.orangeAccent,
              child: Text('F'),
            ),
          ),
          CustomListTile(
            Icons.person,
            'Mi Perfil',
            (){}
          ),
          CustomListTile(
            Icons.work,
            'Mis Servicios',
            (){}
          ),
          CustomListTile(
            Icons.settings,
            'Configuración',
            (){}
          ),
          CustomListTile(
            Icons.lock,
            'Cerrar Sesión',
            (){}
          ),
          
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: kPrimaryColor,
            )
          ],
        ),
      ),
    );
  }
}
