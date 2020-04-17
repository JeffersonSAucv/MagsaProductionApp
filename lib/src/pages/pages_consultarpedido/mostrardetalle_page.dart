//PAGINA DONDE  SE MUESTRA EL DETALLE DEL PEDIDO  CONSULTADO

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:repartos_magsa/src/models/modelo_pedido.dart';
import 'package:repartos_magsa/src/services/pedidos_services.dart';
import 'package:repartos_magsa/utils/responsive.dart';
import 'package:repartos_magsa/src/widgets/appbar_welcome_custom.dart';

class MostrarDetallePedidoConsultoraPage extends StatelessWidget {

  final List<Pedidos> pedidos;
  

  const MostrarDetallePedidoConsultoraPage({Key key, this.pedidos}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    final pedidosServices =
        Provider.of<PedidosServices>(context).detalleSeguimientoPedido;
    return SafeArea(
      child: Scaffold(
        body: Container(
           
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: pedidosServices.length,
            itemBuilder: (BuildContext context, int index) {
            return  InformacionPedido(pedidos:pedidosServices , index: index);
           },
          ),
        ),
      ),
    );
  }
}

class InformacionPedido extends StatelessWidget {
 
  final List<Pedidos> pedidos;
  final int index;

  const InformacionPedido({Key key, this.pedidos, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  responsive = Responsive(context);  //* FUNCION RESONSIVE PARA LA APP
    return Container(
      height: responsive.heigthp(100),
      child: Stack(
        children: <Widget>[
          AppBarWelcome(
            texto: 'Seguimiento',
            ontap: () => Navigator.pop(context),
          ),
          Positioned(top: responsive.heigthp(8), child: HeadSeguimientoPedido(pedidos: pedidos, index: index,)),
          Positioned(bottom: responsive.heigthp(0), child: BodyDetallePedido(pedidos: pedidos, index: index))
        ],
      ),
    );
  }
}

class HeadSeguimientoPedido extends StatelessWidget {

  final List<Pedidos> pedidos;
  final int index;

  const HeadSeguimientoPedido({Key key, this.pedidos, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final alto = MediaQuery.of(context).size;
    final  responsive = Responsive(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      height: alto.height * 0.45,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Hola ${pedidos[index].nombreConsultora}!",
              style: TextStyle(
                  fontSize: responsive.inchp(3),
                  fontFamily: 'Rubik Bold',
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 10,
          ),
          Text("A continuación te detallamos el seguimiento de tu pedido",
              style: TextStyle(fontSize:  responsive.inchp(2.5), fontFamily: 'Rubik Regular')),
          SizedBox(
            height: 10,
          ),
          CuadradoNegro(pedidos: pedidos, index: index,),
          SizedBox(
            height: 10,
          ),
          Text("Trazabilidad Pedido",
              style: TextStyle(fontSize: responsive.inchp(2.5), fontFamily: 'Rubik Regular')),
        ],
      ),
    );
  }
}

class CuadradoNegro extends StatelessWidget {
  final List<Pedidos> pedidos;
  final int index;

  const CuadradoNegro({Key key, this.pedidos, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final  responsive = Responsive(context);
    return Container(
      width: responsive.widthp(90),
      height: responsive.heigthp(20),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.75),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Orden Nº:",
                    style: TextStyle(
                        fontSize: responsive.inchp(2.5),
                        fontFamily: 'Rubik Medium',
                        color: Colors.white)),
                Text("#${pedidos[index].codigoPedido}",
                    style: TextStyle(
                        fontSize: responsive.inchp(2.5),
                        fontFamily: 'Rubik Regular',
                        color: Colors.white))
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'assets/box.png',
                    width: responsive.widthp(13),
                    height: responsive.heigthp(13),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text((pedidos[index].idEvento ==null)? 'Estatus Actual: -' :"Estatus Actual: ${pedidos[index].idEvento.descripcionEstado}",
                        style: TextStyle(
                            fontSize: responsive.inchp(2),
                            fontFamily: 'Rubik Medium',
                            color: Colors.white)),
                    Text((pedidos[index].idTiempoentrega ==null)? 'Entrega Estimada: -' :"Entrega Estimada: ${pedidos[index].idTiempoentrega.diasTiempoEntrega}",
                        style: TextStyle(
                            fontSize: responsive.inchp(2),
                            fontFamily: 'Rubik Medium',
                            color: Colors.white))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BodyDetallePedido extends StatelessWidget {
  final List<Pedidos> pedidos;
  final int index;

  const BodyDetallePedido({Key key, this.pedidos, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    /* final dateFormat = DateFormat('dd-MM-yyyy');
    DateTime date=DateTime.parse(pedidos[index].fechaEnLocal.toString()); */
    final  responsive = Responsive(context);

    final alto = MediaQuery.of(context).size;
    return Container(
      height: alto.height * 0.5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Color(0xffFFBF00),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: SingleChildScrollView(
        
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: responsive.heigthp(5),
            ),
            Container(
              width:  responsive.widthp(95),
              height: responsive.widthp(35),
              decoration: BoxDecoration(
                  color: Color(0xff333333),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Llegada a Almacén",
                            style: TextStyle(
                                fontSize: responsive.inchp(2.5),
                                fontFamily: 'Rubik Medium',
                                color: Color(0xffFFBF00))),
                        SizedBox(
                          height: 20,
                        ),
                        Text( (pedidos[index].fechaEnLocal ==null)? 'Fecha: -' :'Fecha: ${DateFormat.yMMMd().format(pedidos[index].fechaEnLocal)}',
                            style: TextStyle(
                                fontSize: responsive.inchp(2),
                                fontFamily: 'Rubik Medium',
                                color: Colors.white)),
                        Text("Hora: -",
                            style: TextStyle(
                                fontSize: responsive.inchp(2),
                                fontFamily: 'Rubik Medium',
                                color: Colors.white))
                      ],
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      'assets/delivery.png',
                      width: responsive.widthp(40),
                      height: responsive.heigthp(30),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width:  responsive.widthp(95),
              height: responsive.widthp(35),
              decoration: BoxDecoration(
                  color:  Color(0xff333333),//Colors.black.withOpacity(0.80),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Salida a Reparto",
                            style: TextStyle(
                                fontSize: responsive.inchp(2.5),
                                fontFamily: 'Rubik Medium',
                                color: Color(0xffFFBF00))),
                        SizedBox(
                          height: 20,
                        ),
                        Text((pedidos[index].fechaEnRuta ==null)? 'Fecha: -' :"Fecha: ${DateFormat.yMMMd().format(pedidos[index].fechaEnRuta)}",
                            style: TextStyle(
                                fontSize: responsive.inchp(2),
                                fontFamily: 'Rubik Medium',
                                color: Colors.white)),
                        Text("Hora:  - ",
                            style: TextStyle(
                                fontSize: responsive.inchp(2),
                                fontFamily: 'Rubik Medium',
                                color: Colors.white)),
                        Text((pedidos[index].idUser ==null)? 'Repartidor: -' :"Repartidor: ${pedidos[index].idUser.username}",
                            style: TextStyle(
                                fontSize: responsive.inchp(2),
                                fontFamily: 'Rubik Medium',
                                color: Colors.white))
                      ],
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      'assets/repartidor-entregando.png',
                      width: responsive.widthp(40),
                      height: responsive.heigthp(30),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width:  responsive.widthp(95),
              height: responsive.widthp(35),
              decoration: BoxDecoration(
                  color: Color(0xff333333),
                  borderRadius: BorderRadius.circular(10)),
                  child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Entrega",
                            style: TextStyle(
                                fontSize: responsive.inchp(2.5),
                                fontFamily: 'Rubik Medium',
                                color: Color(0xffFFBF00))),
                        SizedBox(
                          height: 20,
                        ),
                        Text((pedidos[index].fechaEntregado ==null)? 'Fecha: -' : "Fecha: ${DateFormat.yMMMd().format(pedidos[index].fechaEntregado)}",
                            style: TextStyle(
                                fontSize: responsive.inchp(2),
                                fontFamily: 'Rubik Medium',
                                color: Colors.white)),
                        Text("Hora: ",
                            style: TextStyle(
                                fontSize: responsive.inchp(2),
                                fontFamily: 'Rubik Medium',
                                color: Colors.white))
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: Image.asset(
                      'assets/entregapedido.png',
                      width: responsive.widthp(30),
                      height: responsive.heigthp(20),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
