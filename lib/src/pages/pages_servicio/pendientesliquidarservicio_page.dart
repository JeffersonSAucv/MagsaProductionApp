import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';
import 'package:repartos_magsa/src/models/modelo_pedido.dart';
import 'package:repartos_magsa/src/models/modelo_usuario.dart';
import 'package:repartos_magsa/src/services/pedidos_services.dart';
import 'package:repartos_magsa/src/widgets/card_personalizado_servicio.dart';
import 'package:repartos_magsa/src/widgets/dialogs_widget.dart';

//** PAGINA DONDE SE LISTARAN LOS PEDIDOS PENDIENTES DE LIQUIDACION
class PendientesLiquidacionServicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pedidosServices =
        Provider.of<PedidosServices>(context).pendientesLiquidarServicio;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: PedidosPendienteLiquidarServicio(
            pedidos: pedidosServices,
          ),
        ),
      ),
    );
  }
}

class PedidosPendienteLiquidarServicio extends StatefulWidget {
  final List<Pedidos> pedidos;

  const PedidosPendienteLiquidarServicio({this.pedidos});

  @override
  _PedidosPendienteLiquidarServicioState createState() =>
      _PedidosPendienteLiquidarServicioState();
}

class _PedidosPendienteLiquidarServicioState
    extends State<PedidosPendienteLiquidarServicio> {
  @override
  Widget build(BuildContext context) {
    if (widget.pedidos.isEmpty) {
      return Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/delivery.png',
              height: 250,
              width: 200,
            ),
            Text("No hay por liquidar aún")
          ],
        )),
      );
    } else {
      return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: widget.pedidos.length,
        itemBuilder: (BuildContext context, int index) {
          print("PEDIDOS TOTALESSSS : ${widget.pedidos.length}");
          return FadeInLeft(
            duration: Duration(milliseconds: 400),
            child: CardPedidoPersonalizadoServicioWidget(
              //*LISTA DE PEDIDOS E INDEX PARA CUMPLI CONDICIONES  EN EL WIDGET CUSTOMIZADO
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
              fechaEntregaPedidoText:
                  widget.pedidos[index].fechaEntregado.toString(),
              campaniaText: widget.pedidos[index].idCampania.descripCampania,
              remesaText: widget.pedidos[index].idSemana.descripRemesa,
              repartidorNombreText: widget.pedidos[index].idUser.username,

              //*TOP BANNER CARD
              iconbg: FontAwesomeIcons.hourglass,
              color1bg: Color(0xff0072ff),
              color2bg: Color(0xff00c6ff),

              //* BOTONES ACCION
              tituloaccion1: 'LIQUIDAR',
              colorbotonaccion1: Colors.green,
              accionboton1tap: () {
                Dialogs.liquidarPedido(context,
                    title: 'Confirmar Accion',
                    message: '¿Desea marcar el pedido como Liquidado?',
                    accionConfirmar: () async {
                  try {
                    DatosUsuario datosUsuario =
                        Provider.of<DatosUsuario>(context, listen: false);

                    bool resultadoActulizacion =
                        await Provider.of<PedidosServices>(context,
                                listen: false)
                            .liquidarPedido(
                                user: datosUsuario,
                                pedido: widget.pedidos.elementAt(index));

                    if (resultadoActulizacion) {
                      Provider.of<PedidosServices>(context, listen: false)
                          .liquidadosServicio
                          .add(widget.pedidos.elementAt(index));
                      setState(() => widget.pedidos.removeAt(index));
                      Navigator.pop(context); //CIERRA EL DIALOG
                    } else {
                      // show dialog error
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
            ),
          );
        },
      );
    }
  }
}
