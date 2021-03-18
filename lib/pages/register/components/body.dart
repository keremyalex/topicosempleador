import 'dart:convert';
import 'dart:io';
import 'package:empleador_app/constants.dart';
import 'package:empleador_app/pages/components/build_form_email.dart';
import 'package:empleador_app/pages/components/build_form_number.dart';
import 'package:empleador_app/pages/components/build_form_password.dart';
import 'package:empleador_app/pages/components/build_form_text.dart';
import 'package:empleador_app/pages/components/custom_surfix_icon.dart';
import 'package:empleador_app/pages/components/default_button.dart';
import 'package:empleador_app/pages/components/mostrar_alerta.dart';
import 'package:empleador_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  String getNombre = '';
  String getApellido = '';
  String getFecha = '';
  String getTelefono = '';
  String getGenero = '';
  String getCI = '';
  String getDepartamento = '';

  //TextEditingController nombre2;

  Future<bool> traerDatos() async {
    String getNombre = await _storage.read(key: 'nombre');
    String getApellido = await _storage.read(key: 'apellido');
    String getFecha = await _storage.read(key: 'fecha');
    String getTelefono = await _storage.read(key: 'telefono');
    String getGenero = await _storage.read(key: 'genero');
    String getCI = await _storage.read(key: 'ci');
    String getDepartamento = await _storage.read(key: 'departamento');

    setState(() {
      if (getNombre == null) {
        this.getNombre = '';
        this.getApellido = '';
        this.getFecha = '';
        this.getTelefono = '';
        this.getGenero = '';
        this.getCI = '';
        this.getDepartamento = '';
      } else {
        if (getNombre != null) {
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

  @override
  // ignore: must_call_super
  void initState() {
    //super.initState();
    traerDatos();
  }

  //Controladores de los TextFormField
  final nameCtrl = new TextEditingController();
  final apellidoCtrl = new TextEditingController();
  final telephoneCtrl = new TextEditingController();
  final emailCtrl = new TextEditingController();
  final passwordCtrl = new TextEditingController();
  String name;
  String apellido;
  String telephone;
  String fecha = '';
  String genero = '';
  String departamento = '';
  String ci;
  final ciCtrl = new TextEditingController();

  //Almacenar datos en dispositivo
  final _storage = new FlutterSecureStorage();

  //Imagen
  File _image;
  final picker = ImagePicker();

  Future getImage(String tipo) async {
    PickedFile pickedFile;
    if (tipo == 'camera') {
      pickedFile = await picker.getImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    }

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  //Variables para la fecha de nacimiento
  DateTime _dateTime;
  String formattedDate = '';

  //genero
  var generos = ["Masculino", "Femenino", "Otro"];
  var currentSelectedValue;

  var departamentos = [
    "Santa Cruz",
    "Beni",
    "Pando",
    "Cochabamba",
    "Chiquisaca",
    "Tarija",
    "La Paz",
    "Oruro",
    "Potosí"
  ];
  var departSelectedValue;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              //Avatar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 95,
                      backgroundColor: kPrimaryColor,
                      child: ClipOval(
                        child: SizedBox(
                            width: 180.0,
                            height: 180.0,
                            child: (_image != null)
                                ? Image.file(
                                    _image,
                                    fit: BoxFit.fill,
                                  )
                                : Image.asset(
                                    'assets/images/avatar.png',
                                    fit: BoxFit.fill,
                                  )),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 60.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_alt,
                            size: 30.0,
                          ),
                          onPressed: () {
                            getImage('camera');
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.add_photo_alternate,
                            size: 30.0,
                          ),
                          onPressed: () {
                            getImage('gallery');
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              BuildFormText(
                controller: nameCtrl,
                labelText: 'Nombre',
                hintText: getNombre == '' ? 'Ingrese su nombre' : getNombre,
                icono: Icon(Icons.person),
                onSaved: (String newValue) => name = newValue,
                validator: (String value) {
                  if (value.isEmpty || value.length < 2) {
                    return kNamelNullError;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              BuildFormText(
                controller: apellidoCtrl,
                labelText: 'Apellido(s)',
                hintText:
                    getApellido == '' ? 'Ingrese su apellido' : getApellido,
                icono: Icon(Icons.person),
                onSaved: (String newValue) => apellido = newValue,
                validator: (String value) {
                  if (value.isEmpty || value.length < 2) {
                    return kLastNamelNullError;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),

              InputDecorator(
                  decoration: InputDecoration(
                      labelText: 'Fecha de Nacimiento',
                      suffixIcon: Icon(Icons.calendar_today),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: GestureDetector(
                    onTap: () {
                      print('tap');
                      showDatePicker(
                        locale: const Locale('es'),
                        context: context,
                        initialDate: _dateTime == null
                            ? DateTime(DateTime.now().year - 20,
                                DateTime.now().month, DateTime.now().day)
                            : _dateTime,
                        firstDate: DateTime(1930),
                        lastDate: DateTime(DateTime.now().year - 19),
                      ).then((date) {
                        if (date != null) {
                          setState(() {
                            _dateTime = date;
                            DateFormat formatter = new DateFormat('yyyy-MM-dd');
                            formattedDate = formatter.format(_dateTime);
                            fecha = formattedDate;
                          });
                        }
                      });
                      FocusScope.of(context).requestFocus(new FocusNode());
                    },
                    child: getFecha != ''
                        ? Text(getFecha)
                        : Text(_dateTime == null
                            ? 'Seleccionar fecha..'
                            : formattedDate),
                  )),

              SizedBox(
                height: 20,
              ),
              BuildFormNumber(
                controller: telephoneCtrl,
                labelText: 'Teléfono',
                hintText:
                    getTelefono == '' ? 'Ingrese su teléfono' : getTelefono,
                icono: Icon(Icons.phone),
                onSaved: (String newValue) => telephone = newValue,
                validator: (String value) {
                  if (value.isEmpty || value.length < 7) {
                    return kPhoneNumberNullError;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),

              InputDecorator(
                decoration: InputDecoration(
                    labelText: 'Género',
                    suffixIcon: Icon(Icons.people_outline),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      value: currentSelectedValue,
                      hint: getGenero == ''
                          ? Text('Seleccionar..')
                          : Text(getGenero),
                      items: generos
                          .map((e) => DropdownMenuItem<String>(
                              value: e, child: Text(e)))
                          .toList(),
                      onChanged: (String val) {
                        setState(() {
                          currentSelectedValue = val;
                          genero = currentSelectedValue;
                        });
                      }),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              BuildFormNumber(
                controller: ciCtrl,
                labelText: 'Cédula de Identidad',
                hintText: 'Ingrese su número de CI',
                icono: Icon(Icons.portrait),
                onSaved: (String newValue) => ci = newValue,
                validator: (String value) {
                  if (value.isEmpty || value.length < 2) {
                    return kCINullError;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              InputDecorator(
                decoration: InputDecoration(
                    labelText: 'Departamento',
                    suffixIcon: Icon(Icons.location_city),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      value: departSelectedValue,
                      hint: Text('Seleccionar..'),
                      items: departamentos
                          .map((e) => DropdownMenuItem<String>(
                              value: e, child: Text(e)))
                          .toList(),
                      onChanged: (String val) {
                        setState(() {
                          departSelectedValue = val;
                          departamento = departSelectedValue;
                        });
                      }),
                ),
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
                text: 'Siguiente',
                press: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    // if all are valid then go to success screen

                    //Para la imagen

                    //if(getNombre!=nameCtrl.text ) write (ver posibilidad)
                    if (nameCtrl.text != '' &&
                        apellidoCtrl.text != '' &&
                        fecha != '' &&
                        telephoneCtrl.text != '' &&
                        genero != '' &&
                        ciCtrl.text != '' &&
                        departamento != '') {
                      if (_image == null) return;
                      String base64Image =
                          base64Encode(_image.readAsBytesSync());
                      String fileName = _image.path.split("/").last;

                      await _storage.write(
                          key: 'base64Image', value: base64Image);
                      await _storage.write(key: 'filename', value: fileName);
                      await _storage.write(
                          key: 'nombre', value: nameCtrl.text.trim());
                      await _storage.write(
                          key: 'apellido', value: apellidoCtrl.text.trim());
                      await _storage.write(key: 'fecha', value: fecha.trim());
                      await _storage.write(
                          key: 'telefono', value: telephoneCtrl.text.trim());
                      await _storage.write(key: 'genero', value: genero);
                      await _storage.write(
                          key: 'ci', value: ciCtrl.text.trim());
                      await _storage.write(
                          key: 'departamento', value: departamento);

                      print('Guardando Datos Temporales');

                      final registroOk = await authService.register(
                          getNombre,
                          getApellido,
                          getFecha,
                          getTelefono,
                          getGenero,
                          getCI,
                          getDepartamento,
                          emailCtrl.text,
                          passwordCtrl.text,
                          base64Image,
                          fileName);
                      print('Resgistro es: $registroOk');
                      if (registroOk) {
                        // mostrarAlerta(context, 'Registro',
                        //     'Usuario Registrado Satisfactoriamente');
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'home', (route) => false);
                      } else {
                        mostrarAlerta(context, 'Login y Registro incorrecto',
                            'Revise sus credenciales nuevamente');
                      }
                    } else {
                      //agregar el else if, si estan los datos en el storage getNombre, getApellido, etc
                      mostrarAlerta(context, 'Faltan Datos',
                          'Por favor, agregue los campos faltantes');
                    }
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              // DefaultButton(
              //   press: () async {
              //     // String getNombre = await _storage.read(key: 'nombre');
              //     // String getApellido = await _storage.read(key: 'apellido');
              //     // String getFecha = await _storage.read(key: 'fecha');
              //     // String getTelefono = await _storage.read(key: 'telefono');
              //     // String getGenero = await _storage.read(key: 'genero');

              //     print('nombre: ' + getNombre);
              //     print(getApellido);
              //     print(getFecha);
              //     print(getTelefono);
              //     print(getGenero);

              //     // print(nameCtrl.text);
              //     // print(apellidoCtrl.text);
              //     // print(fecha);
              //     // print(telephoneCtrl.text);
              //     // print(genero);
              //   },
              //   text: 'Datos',
              // )
            ],
          ),
        ),
      ),
    ));
  }
}
