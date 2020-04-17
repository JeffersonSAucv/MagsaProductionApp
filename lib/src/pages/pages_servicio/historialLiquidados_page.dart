import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';
import 'package:repartos_magsa/src/services/pedidos_services.dart';

import 'package:repartos_magsa/src/models/modelo_pedido.dart';

import 'package:repartos_magsa/src/widgets/card_personalizado_servicio.dart';

//** PAGINA DONDE SE LISTARAN EL HISTORIAL DE  PEDIDOS LIQUIDADOS
class PedidosLiquidadosServicioPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final pedidosServices = Provider.of<PedidosServices>(context).historialPedidos;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: PedidosPendienteLiquidarServicio(pedidos: pedidosServices,),
       ),
   ),
    );
  }
}

class PedidosPendienteLiquidarServicio extends StatelessWidget {
  
  final List<Pedidos> pedidos;

  const PedidosPendienteLiquidarServicio({Key key, this.pedidos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: pedidos.length,
      itemBuilder: (BuildContext context, int index) {
      return FadeInLeft(
        duration: Duration(milliseconds:  400),
        child: CardPedidoPersonalizadoServicioWidget(
          
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
            iconbg:  FontAwesomeIcons.history,
            color1bg: Color(0xff56ab2f),
            color2bg: Color(0xffa8e063),
 
            //* BOTONES ACCION
           /*  tituloaccion1:'LIQUIDAR',
            colorbotonaccion1: Colors.green,
            accionboton1tap: (){ print(pedidos[index].id);},  */

        ),
      );
     },
    );
  }
}
