import 'package:day_picker/day_picker.dart';
import 'package:empleador_app/constants.dart';
import 'package:empleador_app/pages/components/build_form_email.dart';
import 'package:empleador_app/pages/components/build_form_number.dart';
import 'package:empleador_app/pages/components/build_form_password.dart';
import 'package:empleador_app/pages/components/custom_surfix_icon.dart';
import 'package:empleador_app/pages/components/default_button.dart';
import 'package:empleador_app/pages/components/mostrar_alerta.dart';
import 'package:empleador_app/services/area_service.dart';
import 'package:empleador_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:time_range_picker/time_range_picker.dart';


class Body2 extends StatefulWidget {
  @override
  _Body2State createState() => _Body2State();
}

class _Body2State extends State<Body2> {
  final _storage = new FlutterSecureStorage();

  //Datos desde body1 y almacenamiento
  String getNombre = '';
  String getApellido = '';
  String getFecha = '';
  String getTelefono = '';
  String getGenero = '';
  String getCI = '';
  String getDepartamento = '';
  String getBase64Image = '';
  String getFilename = '';
  String getIDArea = '';

  Future<bool> traerDatos() async {
    String getBase64Image = await _storage.read(key: 'base64Image');
    String getFilename = await _storage.read(key: 'filename');
    String getNombre = await _storage.read(key: 'nombre');
    String getApellido = await _storage.read(key: 'apellido');
    String getFecha = await _storage.read(key: 'fecha');
    String getTelefono = await _storage.read(key: 'telefono');
    String getGenero = await _storage.read(key: 'genero');
    String getCI = await _storage.read(key: 'ci');
    String getDepartamento = await _storage.read(key: 'departamento');

    setState(() {
      if (getNombre == null) {
        this.getBase64Image = '';
        this.getFilename = '';
        this.getNombre = '';
        this.getApellido = '';
        this.getFecha = '';
        this.getTelefono = '';
        this.getGenero = '';
        this.getCI = '';
        this.getDepartamento = '';
      } else {
        if (getNombre != null) {
          this.getBase64Image = getBase64Image;
          this.getFilename = getFilename;
          this.getNombre = getNombre;
          this.getApellido = getApellido;
          this.getFecha = getFecha;
          this.getTelefono = getTelefono;
          this.getGenero = getGenero;
          this.getCI = getCI;
          this.getDepartamento = getDepartamento;
        }
      }
    });
    return true;
  }

  List<String> areastrab2 = new List();
  List<String> trabajos2 = new List();
  List<String> dias = new List();

  String diasStr = '';

  @override
  // ignore: must_call_super
  void initState() {
    traerAreaTrabajo();
    //traerTrabajo();
  }

  Future traerAreaTrabajo() async {
    final areaService = Provider.of<AreaService>(context, listen: false);
    final getAreas = await areaService.getAreas();
    if (getAreas != null) {
      setState(() {
        areastrab2 = getAreas;
      });
    }
  }

  final precioCtrl = new TextEditingController();
  final notaCtrl = new TextEditingController();
  final emailCtrl = new TextEditingController();
  final passwordCtrl = new TextEditingController();

  var areastrab = ["Computación", "Hogar", "Construcción"];
  var areaSelectedValue;

  // var trabajos = [
  //   "Mantenimiento",
  //   "Cerrajero",
  //   "Jardinero",
  //   "Plomero",
  //   "Albañil"
  // ];
  var trabSelectedValue;

  //TimeRange result;
  String horarioRange = '';

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            InputDecorator(
              decoration: InputDecoration(
                  labelText: 'Área de Trabajo',
                  suffixIcon: Icon(Icons.group_work),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    value: areaSelectedValue,
                    hint: Text('Seleccionar..'),
                    items: areastrab2
                        .map((e) =>
                            DropdownMenuItem<String>(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (String val) async {
                      setState(() {
                        //actualizar trabajo
                        areaSelectedValue = val;
                      });
                      final areaService =
                          Provider.of<AreaService>(context, listen: false);
                      final getAreas = await areaService.getAreas();
                      if (getAreas != null) {
                        final getTrabajos =
                            await areaService.getSubAreas(areaSelectedValue);
                        setState(() {
                          trabajos2 = getTrabajos;
                        });
                      }
                    }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InputDecorator(
              decoration: InputDecoration(
                  labelText: 'Trabajo',
                  suffixIcon: Icon(Icons.work),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    value: trabSelectedValue,
                    hint: Text('Seleccionar..'),
                    items: trabajos2
                        .map((e) =>
                            DropdownMenuItem<String>(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (String val) {
                      setState(() {
                        trabSelectedValue = val;
                      });
                    }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            BuildFormNumber(
              controller: precioCtrl,
              labelText: 'Precio',
              hintText: 'Ingrese el precio',
              icono: Icon(Icons.attach_money),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLines: 3,
              controller: notaCtrl,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                labelText: 'Nota',
                hintText: 'Escriba una Nota',
                suffixIcon: Icon(Icons.note),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SelectWeekDays(
              boxDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: kPrimaryColor),
              onSelect: (values) {
                //print(values);
                setState(() {
                  dias = values;
                  diasStr = dias.join(' - ');
                  print(diasStr);
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            InputDecorator(
              decoration: InputDecoration(
                  labelText: 'Horario de Atención',
                  suffixIcon: Icon(Icons.calendar_today),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: GestureDetector(
                  onTap: () async {
                    print('tap');

                    TimeRange result = await showTimeRangePicker(
                      context: context,
                      fromText: 'Desde',
                      toText: 'Hasta',
                      labels: [
                        "00:00",
                        "3:00",
                        "6:00",
                        "9:00",
                        "12:00",
                        "15:00",
                        "18:00",
                        "21:00"
                      ].asMap().entries.map((e) {
                        return ClockLabel.fromIndex(
                            idx: e.key, length: 8, text: e.value);
                      }).toList(),
                      labelOffset: 35,
                      rotateLabels: false,
                      padding: 55,
                    );
                    if (result != null) {
                      print('hora ' + result.startTime.format(context));
                      print('horario ' + result.startTime.toString());
                      print("result " +
                          result.startTime.hour.toString() +
                          ':' +
                          result.startTime.minute.toString());
                      setState(() {
                        horarioRange = result.startTime.format(context) +
                            ' - ' +
                            result.endTime.format(context);
                      });
                    }

                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                  child: Text(
                    horarioRange == '' ? 'Seleccionar Horario..' : horarioRange,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            BuildFormEmail(
              controller: emailCtrl,
              labelText: 'Email',
              hintText: 'Ingrese su correo',
              icono: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
            SizedBox(
              height: 20,
            ),
            BuildFormPassword(
              controller: passwordCtrl,
              labelText: 'Password',
              hintText: 'Ingrese su contraseña',
              icono: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
            ),
            SizedBox(
              height: 30,
            ),
            DefaultButton(
              press: () async {
                final datosAntiguos = await traerDatos();
                final areaService =
                    Provider.of<AreaService>(context, listen: false);
                final getID =
                    await areaService.getIDSubAreas(trabSelectedValue);
                setState(() {
                  getIDArea = getID;
                });

                print(getNombre);
                print(getIDArea);
                print(precioCtrl.text);
                print(notaCtrl.text);
                print(diasStr);
                print(horarioRange);
                print(emailCtrl.text);
                print(passwordCtrl.text);

                final registroOk = await authService.register(
                    getNombre,
                    getApellido,
                    getFecha,
                    getTelefono,
                    getGenero,
                    getCI,
                    getDepartamento,
                    getIDArea,
                    precioCtrl.text,
                    notaCtrl.text,
                    diasStr,
                    horarioRange,
                    emailCtrl.text,
                    passwordCtrl.text,
                    getBase64Image,
                    getFilename);
                print('Resgistro es: $registroOk');
                if (registroOk) {
                  
                  mostrarAlerta(context, 'Registro',
                      'Usuario Registrado Satisfactoriamente');
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'register_success', (route) => false);
                } else {
                  mostrarAlerta(context, 'Login y Registro incorrecto',
                      'Revise sus credenciales nuevamente');
                }
              },
              text: 'Registrar',
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    ));
  }
}
