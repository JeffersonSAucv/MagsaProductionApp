
import 'package:flutter/material.dart';


import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:repartos_magsa/src/models/modelo_usuario.dart';

import 'package:repartos_magsa/src/widgets/background_widget.dart';
import 'package:repartos_magsa/utils/responsive.dart';

class WelcomePage extends StatefulWidget {
  
  static final String routeName = '/welcomepage';
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {


  // Provider instanciamos el user
  bool onlyOnce = true;
  @override
  void didChangeDependencies() {
    if( onlyOnce ){
      Provider.of<DatosUsuario>(context).user = User()..role = Role();
      onlyOnce = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final  responsive = Responsive(context);
    return Scaffold(
      
        body: Stack(
      children: <Widget>[
        BackGround(),
        FadeInLeftBig(delay: Duration(seconds: 4), child: _CuadroBienvenida()),
        Positioned(
            bottom: responsive.inchp(4),
            left: responsive.inchp(2),
            child: ZoomIn(duration: Duration(seconds: 1), child: _LogoMagsa())),
        Positioned(
            top: responsive.inchp(3),
            right: responsive.inchp(2.5),
            child: ElasticInRight(
                delay: Duration(seconds: 2),
                duration: Duration(seconds: 2),
                child: _TextoWelcome()))
      ],
    ));
  }
}

class _TextoWelcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final  responsive = Responsive(context);
    return SafeArea(
      child: Container(
        child: RichText(
          textAlign: TextAlign.right,
          text: TextSpan(
              style: TextStyle(
                  fontSize: responsive.inchp(4),
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'OpenSans-Regular'
                  ),
              children: [
                TextSpan(text: 'Bienvenido elige una\n'),
                TextSpan(text: 'opción para continuar:'),
              ]),
        ),
      ),
    );
  }
}

class _LogoMagsa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final  responsive = Responsive(context);
    return Image.asset(
      'assets/LogoMagsa.png',
      width: responsive.widthp(70),
    );
  }
}

class _CuadroBienvenida extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final  responsive = Responsive(context);
    return Center(
      child: Container(
        height: responsive.heigthp(23),
        width:  responsive.widthp(90),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(0.0, 2.0), //(x,y)
              blurRadius: 8.0,
            ),
          ],
        ), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _BotonBienvenida(
              titulo: 'Iniciar Sesión',
              onTap: () {
                // pushNamed(context, RegisterPageRoute)
                Navigator.pushNamed(context, '/loginpage');
              },
              icon: FontAwesomeIcons.signInAlt,
              color: [
                Color(0xffFFD200),
                Color(0xffFFBF00),
              ],
              colorText: Colors.black,
              iconcolor: Colors.black.withOpacity(0.8),
              colorOnda: Colors.yellow.withOpacity(0.6),
              
            ),
            SizedBox(
              height: 10.0,
            ),
            _BotonBienvenida(
              titulo: 'Consultar Pedido',
              onTap: () {
                Navigator.pushNamed(context, '/consultarpedidoform');
              },
              icon: FontAwesomeIcons.search,
              color: [
                Color(0xff434343),
                Color(0xff5c5c5c),
              ],
              colorText: Colors.white,
              iconcolor: Colors.white.withOpacity(0.8),
              colorOnda: Colors.white.withOpacity(0.4),
            )
          ],
        ),
      ),
    );
  }
}

class _BotonBienvenida extends StatelessWidget {
  final String titulo;
  final Function onTap;
  final IconData icon;
  final List<Color> color;
  final Color colorText;
  final Color iconcolor;
  final Color colorOnda;

  const _BotonBienvenida({@required this.titulo, @required this.onTap, this.icon, this.color, this.colorText, this.iconcolor, this.colorOnda});
  @override
  Widget build(BuildContext context) {
    final  responsive = Responsive(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Material(
        child: RaisedButton(
          splashColor: colorOnda,
          onPressed: onTap,
          padding: const EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
                gradient:  LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: color),
            ),
            child: Container(
              width: responsive.widthp(80),
              height: responsive.heigthp(8),
              child: Row(
           
              children: <Widget>[
                Expanded( flex: 1 ,child: Center(child: Center(child: FaIcon(icon,color: iconcolor)))),
                Expanded( flex: 3 ,child: Text(titulo, style: TextStyle(color: colorText, fontSize: responsive.inchp(3) , fontWeight: FontWeight.w800, fontFamily: 'OpenSans-Regular' ),textAlign: TextAlign.left,))
              ],
        ),
            ),
          ),
        ),
      ),
    );
  }
}
