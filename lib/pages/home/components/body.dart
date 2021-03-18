import 'package:empleador_app/constants.dart';
import 'package:empleador_app/models/trabajador.dart';
import 'package:empleador_app/pages/components/custom_alert.dart';
import 'package:empleador_app/pages/components/mostrar_alerta.dart';
import 'package:empleador_app/services/trabajador_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final mySeachController = TextEditingController();
  List<Trabajador> trabajador = new List();
  @override
  Widget build(BuildContext context) {
    final trabajadorService = Provider.of<TrabajadorService>(context);
    if(mySeachController.text==''){
      final trabajadores = trabajadorService.trabajadores;
    setState(() {
      trabajador = trabajadores;
    });
    }
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
            child: Wrap(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller: mySeachController,
                    decoration: InputDecoration(
                      hintText: '¿Qué desea buscar?',
                      suffixIcon: InkWell(
                        onTap: () {
                          print('buscar');
                          List<Trabajador> temp = trabajador
                              .where((e) => e.nombreServicio == mySeachController.text)
                              .toList();
                          setState(() {
                            trabajador = temp;
                          });
                          print(temp.length);
                        },
                        child: Icon(
                          Icons.search,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.filter_list,
                      color: kPrimaryColor,
                    ),
                    onPressed: () {})
              ],
            ),
          ),
          Expanded(
            child: (trabajador.length == 0)
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'No hay resultados..',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ) 
            :ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: trabajador.length,
              itemBuilder: (context, index) =>
                  // ListTile(
                  //   title: Text('holas'),
                  // ),
                  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  color: Colors.white,
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      print(trabajador[index].nombreTrabajador);
                      customAlert(context, trabajador[index].nombreServicio,
                          '¿Está seguro de la solicitud?');
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage('assets/images/avatar.png'),
                          ),
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(trabajador[index].nombreServicio,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            Text(
                                'Nombre: ${trabajador[index].nombreTrabajador} ${trabajador[index].apellidoTrabajador}'),
                            //Text(trabajador[index].apellidoTrabajador),
                            Text('Descripción: ${trabajador[index].nota}'),
                            Text('Días: ${trabajador[index].dias}'),
                            Text('Disponible: ${trabajador[index].hora}'),
                            Text(
                                'Precio Estandar: ${trabajador[index].precioEstandar}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
