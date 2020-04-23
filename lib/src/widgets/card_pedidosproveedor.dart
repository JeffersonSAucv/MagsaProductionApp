import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:repartos_magsa/src/models/modelo_pedido.dart';
import 'package:repartos_magsa/src/models/modelo_usuario.dart';
import 'package:repartos_magsa/src/services/pedidos_services.dart';
import 'package:repartos_magsa/src/widgets/card_peronalizado.dart';
import 'package:repartos_magsa/src/widgets/dialogs_widget.dart';

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
    if (widget.pedidos.isEmpty) {
      return Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/repartidor.png',
              height: 250,
              width: 200,
            ),
            Text("No tienes Pedidos Asignados aún")
          ],
        )),
      );
    } else {
      return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: widget.pedidos.length,
        itemBuilder: (BuildContext context, int index) {
          return FadeInLeft(
            duration: Duration(milliseconds: 400),
            child: CardPedidoPersonalizadoWidget(
              pedidos: widget.pedidos,
              index: index,
              //*DETALLES CARD
              codigopedidotext: widget.pedidos[index].codigoPedido.toString(),
              nombreDistritoText: widget.pedidos[index].distrito.toString(),
              direccionText: widget.pedidos[index].direccion.toString(),
              consultoraNombreText:
                  widget.pedidos[index].nombreConsultora.toString(),
              telefConsultoraText:
                  widget.pedidos[index].telefonoConsultora.toString(),

              //*TOP BANNER CARD
              iconbg: FontAwesomeIcons.truck,
              color1bg: Color(0xfff46b45),
              color2bg: Color(0xffeea849),

              //*BOTONES CARD
              tituloaccion1: 'ENTREGAR',
              tituloaccion2: 'AUSENTE',
              colorbotonaccion1: Colors.green,
              colorbotonaccion2: Colors.yellow,

              //ENTREGAR PEDIDOS
              accionboton1tap: () {
                // INSTANCIA LOS DATOS DEL USUARIO
                Dialogs.actulizarPedido(context,
                    title: 'Confirmar Acción',
                    message: 'Confirme la entrega del pedido, por favor.',
                    accionConfirmar: () async {
                  try {
                    DatosUsuario datosUsuario =
                        Provider.of<DatosUsuario>(context, listen: false);

                    //LALAMOS AL LA FUNCION DEL PROVIDER ACTULIZAR PEDIDO = PEDIDO ENTREGADO
                    // MANDAMOS LOS DATOS DEL USUARIO Y EL PEDIDO ACTUAL  QUE SE SELECCIONO
                    bool resultadoActulizacion =
                        await Provider.of<PedidosServices>(context,
                                listen: false)
                            .updatePedido(
                                user: datosUsuario,
                                pedido: widget.pedidos.elementAt(index));

                    // SI SE INSERTO CORRECTAMENTE  SE AÑADE A LA LISTA DE PEDIDOS PENDIENTES

                    if (resultadoActulizacion) {
                      Provider.of<PedidosServices>(context, listen: false)
                          .pedidosPendientes
                          .add(widget.pedidos.elementAt(index));
                      // SE RE-DIBUJA  LA PANTALLA
                      setState(() {
                        widget.pedidos.removeAt(index);
                      });
                      Navigator.pop(context); //
                    } else {
                      // show dialog error
                      // No pudo eliminar el contenido
                      Dialogs.errorActulizandoPedido(context,
                          title: 'Ocurrió un Problema!',
                          message:
                              'Vuelve a intentarlo o vuelve reiniciar la aplicacion');
                    }
                  } catch (e) {
                    print(e);
                  }
                });
              },

              //ACCIONA EL DEVOLVER PEDIDO
              accionboton2tap: () {
                Dialogs.pedidoAusente(context,
                    title: 'Confirmar Accion',
                    message: '¿Desea marcar el pedido como ausente?',
                    accionConfirmar: () async {
                  DatosUsuario datosUsuario =
                      Provider.of<DatosUsuario>(context, listen: false);
                  bool resultado =
                      await Provider.of<PedidosServices>(context, listen: false)
                          .pedidoAusente(
                              user: datosUsuario,
                              pedido: widget.pedidos.elementAt(index));

                  if (resultado) {
                    // SE RE-DIBUJA  LA PANTALLA
                    setState(() {
                      widget.pedidos.removeAt(index);
                    });
                    Navigator.pop(context);
                  } else {
                    // show dialog error

                    Dialogs.errorActulizandoPedido(context,
                        title: 'Ocurrió un Problema!',
                        message:
                            'Vuelve a intentarlo o vuelve reiniciar la aplicacion');
                  }
                });
              },
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
