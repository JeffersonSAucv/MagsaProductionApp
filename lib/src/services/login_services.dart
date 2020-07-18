//configuracion de login

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:repartos_magsa/src/models/modelo_usuario.dart';
import 'package:repartos_magsa/src/widgets/dialogs_widget.dart';
import 'package:repartos_magsa/src/utils/constants.dart';
//import 'package:meta/meta.dart';

class AuthApi {
  Future<bool> login(
      String correo, String password, BuildContext context) async {
    try {
      final response = await http.post(LOGIN_AUTH_URL,
          body: {"identifier": correo, "password": password});

      final parsed = json.decode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200) {
        DatosUsuario fetchUserData = DatosUsuario.fromJson(parsed);
        Provider.of<DatosUsuario>(context, listen: false)
            .remplaceAll(fetchUserData);

        if (parsed['user']['role']['id'] == "$ID_PROVEEDOR") {
          Navigator.pushNamedAndRemoveUntil(context, '/homeproveedor',
              (_) => false); //ENVIAR LOS DATOS OBTENIDOS A LA OTRA PAGINA
          return false; // true
        }
        if (parsed['user']['role']['id'] == "$ID_ALMACEN") {
          Navigator.pushNamedAndRemoveUntil(context, '/homeservicio',
              (_) => false); //ENVIAR LOS DATOS OBTENIDOS A LA OTRA PAGINA
          return false; // true
        }
      } else if (response.statusCode == 400) {
        throw PlatformException(
            code: '400',
            message: (parsed['message'][0]['messages'][0]['message'] ==
                    'Identifier or password invalid.')
                ? 'Correo o Contraseña Invalida'
                : 'Intente de nuevo por favor');
      }

      throw PlatformException(
          code: '201',
          message: (parsed['message'][0]['messages'][0]['message'] ==
                  'Identifier or password invalid.')
              ? 'Correo o Contraseña Invalida'
              : 'Intente de nuevo por favor');
    } on PlatformException catch (e) {
      print("Eror ${e.code}: ${e.message[0]}");
      Dialogs.alert(context, title: "Oh! Algo salió mal", message: e.message);
      return false;
    }
  }
}
