import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repartos_magsa/src/models/modelo_usuario.dart';
import 'package:repartos_magsa/src/services/pedidos_services.dart';
import 'package:repartos_magsa/src/widgets/card_pedidosproveedor.dart';

//SE DELEGAN DOS PAGINAS PARA ASI SEPARAR LA VISTA DE LA LOGICA YA QUE EN ESTA 
//PAGINA SE MOSTRARAN BOTONES DE ACCIONES QUE IMPLEMENTAN LOGICA

class EnRutaPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final pedidosServices = Provider.of<PedidosServices>(context).pedidos;
    return SafeArea(
      child: Scaffold(  
        body: Center(
          child: CardPedidosProveedor(pedidosServices), //*llamos al widget donde se cargan los pedidos
       ),
   ),
    );
  }
}