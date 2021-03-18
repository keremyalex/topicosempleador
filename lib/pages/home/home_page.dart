import 'package:empleador_app/constants.dart';
import 'package:empleador_app/pages/home/components/body.dart';
import 'package:empleador_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:empleador_app/pages/perfil/perfil_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectDrawerItem = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return Body();
      case 1:
        return PerfilPage();
    }
  }

  _onSelectedItem(int pos) {
    setState(() {
      _selectDrawerItem = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bienvenido',
          style: theme().appBarTheme.textTheme.headline5,
        ),
      ),
      drawer: Drawer(
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
            Container(
              color: _selectDrawerItem==0?kPrimaryColor:Colors.white,
              child: CustomListTile(Icons.home, 'Home', () {
                _onSelectedItem(0);
                Navigator.of(context).pop();
              }),
            ),
            Container(
              color: _selectDrawerItem==1?kPrimaryColor:Colors.white,
              child: CustomListTile(Icons.person, 'Perfil', () {
                _onSelectedItem(1);
                Navigator.of(context).pop();
              }),
            ),
            CustomListTile(Icons.work, 'Mis Servicios', () {}),
            CustomListTile(Icons.settings, 'Configuración', () {}),
            CustomListTile(Icons.lock, 'Cerrar Sesión', () {}),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectDrawerItem),
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
