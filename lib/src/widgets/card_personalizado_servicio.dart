import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:repartos_magsa/src/models/modelo_pedido.dart';


import 'package:repartos_magsa/utils/responsive.dart';

class CardPedidoPersonalizadoServicioWidget extends StatelessWidget {
  
final List<Pedidos>  pedidos;
final int index;
 
 @required final String    codigopedidotext;
 @required final String    nombreDistritoText;
 @required final String    direccionText;
 @required final String    consultoraNombreText;
 @required final String    telefConsultoraText;
 @required final IconData  iconbg;
 @required final String    repartidorNombreText;

 final String    tituloaccion1;
 final String    tituloaccion2;
 final Function  accionboton1tap;
 final Color     color1bg;
 final Color     color2bg;
 final String    titulo;
 final Color     colorbotonaccion1;
 final Color     colorText;
 final Color     colorOnda;
 final String    fechaEntregaPedidoText;
 final String    campaniaText;
 final String    remesaText;

  const CardPedidoPersonalizadoServicioWidget({ 
  this.codigopedidotext,
  this.nombreDistritoText,
  this.direccionText,
  this.consultoraNombreText,
  this.telefConsultoraText = null ?? null,
  this.tituloaccion1 ='',
  this.tituloaccion2 = '',
  this.accionboton1tap,
  this.iconbg,
  this.titulo     = '',
  this.colorText  = Colors.white,
  this.colorOnda  = Colors.white,
  this.color1bg   = Colors.blue, 
  this.color2bg   = Colors.lightBlue,
  this.colorbotonaccion1 = null ?? null,
  this.pedidos,
  this.index,
  this.fechaEntregaPedidoText = null ?? null,
  this.campaniaText  = null ?? null,
  this.remesaText = null ?? null,
  this.repartidorNombreText,
});


 @override
  Widget build(BuildContext context) {

   
    final  responsive = Responsive(context);
        return Container(
          margin: EdgeInsets.all(20),
          width: double.infinity,
          height: responsive.heigthp(65),
          decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(15),
             color: Colors.white,
            boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(4, 6),
                    blurRadius: 10)
              ],
          ),
          child: Stack(
          children: <Widget>[
            TopBackGround(color1bg: this.color1bg, color2bg: this.color2bg, iconbg: this.iconbg,),
            //TITULO CON CODIGO DE PEDIDO
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox( height: responsive.heigthp(15), width: responsive.widthp(4), ),
                FaIcon(FontAwesomeIcons.hashtag, color: Colors.white, size: responsive.inchp(6),),
                SizedBox(  width: responsive.widthp(5), ),
                Expanded(child: Text(codigopedidotext, style: TextStyle( color: Colors.white, fontSize: responsive.inchp(6), fontFamily: 'OpenSans-Regular'),))
              ],          
            ),
            // DETALLE DEL PEDIDO
            Positioned(
              top: responsive.heigthp(22),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:  8.0, vertical: 5.0),
                child: pedidoDetalle(context) //* condicion paa mostrar en los cards
              ),
            ),
            //BOTONES ACCIONES
           Positioned(
             bottom: responsive.heigthp(1.8),
             child: Container(
               padding: EdgeInsets.symmetric(horizontal: responsive.widthp(30)),
               alignment: Alignment.center,
              child: Row(
                
                children: <Widget>[
    
                   BottomAccion(titulo: tituloaccion1, onTap: accionboton1tap,colorOnda: Colors.white, colorText: Colors.white, colorboton : colorbotonaccion1),
                 
                 
            ], 
          ), 
       ))
      ],
    ));
  }



   Widget pedidoDetalle(BuildContext context){
    
    final  responsive = Responsive(context);
  
    final double sizeTextTitle = responsive.inchp(2.5);
    final double sizeTextSubTitle = responsive.inchp(2);


     return  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans-Regular'
                            ),
                        children: [
                          TextSpan(text: 'Distrito: ', style: TextStyle(fontWeight: FontWeight.w800, fontSize: sizeTextTitle,)),
                          TextSpan(text: nombreDistritoText , style: TextStyle(fontWeight: FontWeight.w400, fontSize: sizeTextSubTitle,)),
                        ]),
                  ),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans-Regular'
                            ),
                        children: [
                          TextSpan(text: 'Punto de entrega: ', style: TextStyle(fontWeight: FontWeight.w800, fontSize: sizeTextTitle,)),
                        ]),
                  ),
                   RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans-Regular'
                            ),
                        children: [
                          TextSpan(text: direccionText , style: TextStyle(fontWeight: FontWeight.w400, fontSize: sizeTextSubTitle,)),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans-Regular'
                            ),
                        children: [
                          TextSpan(text: 'Nombre consultora: ', style: TextStyle(fontWeight: FontWeight.w800, fontSize: sizeTextTitle,)),
                          TextSpan(text: consultoraNombreText , style: TextStyle(fontWeight: FontWeight.w400, fontSize: sizeTextSubTitle,)),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans-Regular'
                            ),
                        children: [
                          TextSpan(text: 'Tlf. Consultora: ', style: TextStyle(fontWeight: FontWeight.w800, fontSize: sizeTextTitle,)),
                          TextSpan(text: telefConsultoraText , style: TextStyle(fontWeight: FontWeight.w400, fontSize: sizeTextSubTitle,)),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans-Regular'
                            ),
                        children: [
                          TextSpan(text: 'Fecha Entrega: ', style: TextStyle(fontWeight: FontWeight.w800, fontSize: sizeTextTitle,)),
                          TextSpan(text: fechaEntregaPedidoText.substring(0,10) , style: TextStyle(fontWeight: FontWeight.w400, fontSize: sizeTextSubTitle,)),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans-Regular'
                            ),
                        children: [
                          TextSpan(text: 'Campaña: ', style: TextStyle(fontWeight: FontWeight.w800, fontSize: sizeTextTitle,)),
                          TextSpan(text: campaniaText , style: TextStyle(fontWeight: FontWeight.w400, fontSize: sizeTextSubTitle,)),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans-Regular'
                            ),
                        children: [
                          TextSpan(text: 'Remesa: ', style: TextStyle(fontWeight: FontWeight.w800, fontSize: sizeTextTitle,)),
                          TextSpan(text: remesaText , style: TextStyle(fontWeight: FontWeight.w400, fontSize: sizeTextSubTitle,)),
                        ]),
                  ),
                    RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans-Regular'
                            ),
                        children: [
                          TextSpan(text: 'Repartidor: ', style: TextStyle(fontWeight: FontWeight.w800, fontSize: sizeTextTitle,)),
                          TextSpan(text: (repartidorNombreText == null) ? '': repartidorNombreText.toUpperCase() , style: TextStyle(fontWeight: FontWeight.w400, fontSize: sizeTextSubTitle,)),
                        ]),
                    ),
                  ], 
                );
    

  }
}

//TOP BANNER CARD
class TopBackGround extends StatelessWidget {

  final Color   color1bg;
  final Color   color2bg;
  final IconData iconbg ;

  const TopBackGround( {
    @required this.color1bg , 
    @required this.iconbg , 
    @required this.color2bg
    
   } );
  @override
  Widget build(BuildContext context) {
    final  responsive = Responsive(context);
    return Container(
      margin: EdgeInsets.zero,
      width: double.infinity,
      height: responsive.heigthp(20),
      decoration: BoxDecoration(
          
          borderRadius: BorderRadius.only( topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                  color1bg,
                  color2bg
              ]
              
              )),
      child: Stack(
          children: <Widget>[

            Positioned(
              right: -15,
              bottom: 5,
            child: Transform.rotate(
              angle: -0.3,
              child: FaIcon(
                iconbg,
                size: responsive.heigthp(19),
                color: Colors.white.withOpacity(0.3),
                
              ),
            )
          )
          ],
      ),
    );
  }
}
//BOTON DE ACCION ENTREGAR, AUSENTE, LIQUIDAR
class BottomAccion extends StatelessWidget {
  final String titulo;
  final Function onTap;
  final Color colorboton;
  final Color colorText;
  final Color colorOnda;

  const BottomAccion({this.titulo, this.onTap, this.colorboton, this.colorText, this.colorOnda});
  @override
  Widget build(BuildContext context) {

     final  responsive = Responsive(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Material(

        color: Colors.transparent,
        child: FlatButton(
          splashColor: colorOnda,
          onPressed: onTap,
          
          padding: const EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
               color: colorboton
            ),
            child: Container(
              width: responsive.widthp(30),
              height: responsive.heigthp(5),
              alignment: Alignment.center,
              child: Text(titulo, style: TextStyle(color: colorText, fontSize: responsive.inchp(2.5) , fontWeight: FontWeight.w800, fontFamily: 'OpenSans-Regular' ),textAlign: TextAlign.left,)),
            
          ),
        ),
      ),
    );
  }
}