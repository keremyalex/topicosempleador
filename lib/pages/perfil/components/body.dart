import 'package:empleador_app/pages/perfil/components/profile_data.dart';
import 'package:empleador_app/pages/perfil/components/profile_image.dart';
import 'package:empleador_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final usuario = authService.usuario;
    return Column(
      children: [
        ProfileImage(
          image: usuario.photo != 's\/n'
              ? DotEnv().env['API_URL'] + usuario.photo
              : null,
        ),
        ProfileData(
          icon: 'assets/icons/User Icon.svg',
          text: usuario.nombre + ' ' + usuario.apellido,
        ),
        ProfileData(
          icon: 'assets/icons/Location point.svg',
          text: usuario.departamento,
        ),
        ProfileData(
          icon: 'assets/icons/Call.svg',
          text: usuario.contato,
        ),
        ProfileData(
          icon: 'assets/icons/Mail.svg',
          text: usuario.email,
        ),
        SizedBox(height: 40,)
      ],
    );
  }
}
