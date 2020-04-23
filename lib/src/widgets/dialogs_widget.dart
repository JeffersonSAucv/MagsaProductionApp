import 'package:flutter/material.dart';

class Dialogs{

  static void alert(BuildContext context, {String title = '', String message =''}){

    showDialog(context: context, builder: (context){

      return AlertDialog(
        title: Text(title,style: TextStyle(fontWeight:FontWeight.bold, fontSize: 18 ),),
        content: Text(message,style: TextStyle(fontWeight:FontWeight.w300, fontSize: 15 ),),
        actions: <Widget>[
          FlatButton(onPressed: ()=> Navigator.pop(context), child: Text("Aceptar"))
        ],
      );
    });

  }

  static void pedidoAusente(BuildContext context, {String title = '', String message ='' , Function accionConfirmar}){

    showDialog(context: context, builder: (context){

      return AlertDialog(
        title: Text(title,style: TextStyle(fontWeight:FontWeight.bold, fontSize: 18 ),),
        content: Text(message,style: TextStyle(fontWeight:FontWeight.w300, fontSize: 15 ),),
        actions: <Widget>[
          FlatButton(onPressed: ()=> Navigator.pop(context), child: Text("Cancelar")),
          FlatButton(onPressed: accionConfirmar , child: Text("Aceptar"))
        ],
      );
    });

  }

   static void cerrarSesion(BuildContext context, {String title = '', String message ='' , Function accionCerrarSesion}){

    showDialog(context: context, builder: (context){

      return AlertDialog(
        title: Text(title,style: TextStyle(fontWeight:FontWeight.bold, fontSize: 18 ),),
        content: Text(message,style: TextStyle(fontWeight:FontWeight.w300, fontSize: 15 ),),
        actions: <Widget>[
          FlatButton(onPressed: ()=> Navigator.pop(context), child: Text("Cancelar")),
          FlatButton(onPressed: accionCerrarSesion, child: Text("Salir"))
        ],
      );
    });

  }


  static void liquidarPedido(BuildContext context, {String title = '', String message ='' , Function accionConfirmar}){

    showDialog(context: context, builder: (context){

      return AlertDialog(
        title: Text(title,style: TextStyle(fontWeight:FontWeight.bold, fontSize: 18 ),),
        content: Text(message,style: TextStyle(fontWeight:FontWeight.w300, fontSize: 15 ),),
        actions: <Widget>[
          FlatButton(onPressed: ()=> Navigator.pop(context), child: Text("Cancelar")),
          FlatButton(onPressed: accionConfirmar , child: Text("Aceptar"))
        ],
      );
    });

  }

  static void actulizarPedido(BuildContext context, {String title = '', String message ='' , Function accionConfirmar}){

    showDialog(context: context, builder: (context){

      return AlertDialog(
        title: Text(title,style: TextStyle(fontWeight:FontWeight.bold, fontSize: 18 ),),
        content: Text(message,style: TextStyle(fontWeight:FontWeight.w300, fontSize: 15 ),),
        actions: <Widget>[
          FlatButton(onPressed: ()=> Navigator.pop(context), child: Text("Cancelar")),
          FlatButton(onPressed: accionConfirmar , child: Text("Aceptar"))
        ],
      );
    });

  }


  static void errorActulizandoPedido(BuildContext context, {String title = '', String message ='' }){

    showDialog(context: context, builder: (context){

      return AlertDialog(
        title: Text(title,style: TextStyle(fontWeight:FontWeight.bold, fontSize: 18 ),),
        content: Text(message,style: TextStyle(fontWeight:FontWeight.w300, fontSize: 15 ),),
        actions: <Widget>[
          FlatButton(onPressed: ()=> Navigator.pop(context), child: Text("Aceptar")),
        ],
      );
    });

  }
}