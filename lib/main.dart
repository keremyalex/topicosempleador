import 'package:empleador_app/routes/routes.dart';
import 'package:empleador_app/services/area_service.dart';
import 'package:empleador_app/services/auth_service.dart';
import 'package:empleador_app/services/push_notifications_provider.dart';
import 'package:empleador_app/services/solicitud_service.dart';
import 'package:empleador_app/services/trabajador_service.dart';
import 'package:empleador_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    final pushProvider = new PushNotificationsProvider();
    pushProvider.initNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => AreaService()),
        ChangeNotifierProvider(create: (_) => TrabajadorService()),
        ChangeNotifierProvider(create: (_) => SolicitudService())
      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('es', ''),
        ],
        locale: Locale('es'),
        debugShowCheckedModeBanner: false,
        theme: theme(),
        title: 'Trabajo App',
        initialRoute: 'login',
        routes: routes,
      ),
    );
  }
}
