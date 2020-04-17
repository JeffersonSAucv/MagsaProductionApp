import 'package:flutter/material.dart';

class SettingServicioPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(

          onPressed: (){
            Navigator.pushReplacementNamed(context, '/welcomepage');
          },
          child: Text("Cerrar Sesión"),
        ),
     ),
   );
  }
}