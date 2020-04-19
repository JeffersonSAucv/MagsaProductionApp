import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:repartos_magsa/src/models/modelo_pedido.dart';
import 'package:repartos_magsa/src/models/modelo_usuario.dart';
import 'package:repartos_magsa/src/services/pedidos_services.dart';
import 'package:repartos_magsa/src/widgets/card_peronalizado.dart';

//*PAGINA DONDE CARGAMOS LOS PEDIDOS EN RUTA DEL PROVEEDOR 

class CardPedidosProveedor extends StatefulWidget {
  final List<Pedidos> pedidos;

  const CardPedidosProveedor(this.pedidos);

  @override
  _CardPedidosProveedorState createState() => _CardPedidosProveedorState();
}

class _CardPedidosProveedorState extends State<CardPedidosProveedor> {
  @override
  Widget build(BuildContext context) {

    if( widget.pedidos.isEmpty ){
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Image.asset('assets/repartidor.png', height: 250, width: 200,),
                Text("No tienes Pedidos Asignados aún")
            ], 
          )
        ),
      );
    } else {
      return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: widget.pedidos.length,
          itemBuilder: (BuildContext context, int index) {
          return  FadeInLeft(
            duration: Duration(milliseconds:  400),
            child: CardPedidoPersonalizadoWidget(

                pedidos:     widget.pedidos,
                index:            index,
                //*DETALLES CARD 
                codigopedidotext:     widget.pedidos[index].codigoPedido.toString(),
                nombreDistritoText:   widget.pedidos[index].distrito.toString(),
                direccionText:        widget.pedidos[index].direccion.toString() ,
                consultoraNombreText: widget.pedidos[index].nombreConsultora.toString(),
                telefConsultoraText:  widget.pedidos[index].telefonoConsultora.toString(),
                
                //*TOP BANNER CARD
                iconbg:  FontAwesomeIcons.truck,
                color1bg: Color(0xfff46b45),
                color2bg: Color(0xffeea849),

                //*BOTONES CARD
                tituloaccion1:'ENTREGAR',
                tituloaccion2: 'AUSENTE',
                colorbotonaccion1: Colors.green,
                colorbotonaccion2: Colors.yellow,
                accionboton1tap: () async { 
                  DatosUsuario datosUsuario = Provider.of<DatosUsuario>(context, listen: false);
                  bool resultado = await Provider.of<PedidosServices>(context, listen: false).updatePedido( user: datosUsuario, pedido: widget.pedidos.elementAt(index) );
                  if( resultado ){
                    Provider.of<PedidosServices>(context, listen: false).pedidosPendientes.add(widget.pedidos.elementAt(index));
                    setState(() {
                      widget.pedidos.removeAt(index);
                    });
                  } else {
                    // show dialog error
                    // No pudo eliminar el contenido
                  }
                },
                accionboton2tap : (){},

                  ),
          );
        },
        ); 
    }
 
  }
}


/* CardPedidoWidget(

  //DETALLES CARD 
  codigopedidotext: '99999',
  nombreDistritoText:  'TRUJILLO',
  direccionText: 'LAS QUINTANAS 123',
  consultoraNombreText: 'LEIDY GONZALEZ',
  telefConsultoraText: '990383423',
  
  //TOP BANNER CARD
  iconbg: FontAwesomeIcons.truck,
  color1bg:Color(0xff0072ff),
  color2bg: Color(0xff00c6ff),

  // BOTONES CARD
  tituloaccion1:'ENTREGAR',
  tituloaccion2: 'AUSENTE',
  accionboton1tap: (){},
  accionboton2tap : (){},

    ); */


