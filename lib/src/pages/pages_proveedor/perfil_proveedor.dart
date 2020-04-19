import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/modelo_usuario.dart';


class PerfilProveedorPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<DatosUsuario>(context, listen: false).user;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Mi Perfil"),
      ),
        body: Container(
          padding: EdgeInsets.only(top: 10),
          height: double.infinity,
          child: ListTile(
          title:  Text('Nombre: ${user.username}', style: TextStyle(fontSize: 25),),
          subtitle:  Text('Correo: ${user.email}', style: TextStyle(fontSize: 20),),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS4VVmAUuAmb5Z9mcKqAPpy7KIHy4gkGPckOZnfSm2xQzYEucNT&usqp=CAU'),
          ),
        ),
        )
   );
  }
}