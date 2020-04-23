//PAGINA PENDIENTES DE LIQUIDAR DE LOS PROVEEDORES

import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';

import 'package:repartos_magsa/src/models/modelo_pedido.dart';

import 'package:repartos_magsa/src/services/pedidos_services.dart';
import 'package:repartos_magsa/src/widgets/card_peronalizado.dart';


class PedidosPendientesLiquidacionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     final pedidosServices = Provider.of<PedidosServices>(context).pedidosPendientes;
      
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: PedidosPendientesLiquidarProveedor(pedidos: pedidosServices),
       ),
   ),
    );
  }
}

class PedidosPendientesLiquidarProveedor extends StatelessWidget {
  
  final List<Pedidos> pedidos;

  const PedidosPendientesLiquidarProveedor({@required this.pedidos});

  @override
  Widget build(BuildContext context) {

     if (pedidos.isEmpty) {
        return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Image.asset('assets/repartidor.png', height: 250, width: 200,),
                Text("No tienes pedidos para liquidar aún")
            ], 
          )
        ),
      );
     } else {
     

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: pedidos.length,
      itemBuilder: (BuildContext context, int index) {
         print("PEDIDOS TOTALESSSS : ${pedidos.length}");
      return FadeInLeft(
        duration: Duration(milliseconds:  400),
        child: CardPedidoPersonalizadoWidget(
            //*LISTA DE PEDIDOS E INDEX PARA CUMPLI CONDICIONES  EN EL WIDGET CUSTOMIZADO
            pedidos: pedidos,
            index:   index,
           //*DETALLES CARD 
            codigopedidotext:       pedidos[index].codigoPedido.toString(),
            nombreDistritoText:     pedidos[index].distrito.toString(),
            direccionText:          pedidos[index].direccion.toString() ,
            consultoraNombreText:   pedidos[index].nombreConsultora.toString(),
            telefConsultoraText:    pedidos[index].telefonoConsultora.toString(),
            fechaEntregaPedidoText: pedidos[index].fechaEntregado.toString(),
            campaniaText:           pedidos[index].idCampania.descripCamapania,
            remesaText:             pedidos[index].idRemesa.descripRemesa,
            
            //*TOP BANNER CARD
            iconbg:  FontAwesomeIcons.hourglass,
            color1bg: Color(0xff0072ff),
            color2bg: Color(0xff00c6ff),

           
        ),
      );
     },
    );
    }
  }
}

