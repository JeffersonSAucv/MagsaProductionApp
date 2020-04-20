//*PAGINA HOME DE DE  SERVICIO
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';
import 'package:repartos_magsa/src/models/modelo_usuario.dart';
import 'package:repartos_magsa/src/pages/pages_servicio/ausentesservicio_page.dart';
import 'package:repartos_magsa/src/pages/pages_servicio/historialLiquidados_page.dart';
import 'package:repartos_magsa/src/pages/pages_servicio/pendientesliquidarservicio_page.dart';
import 'package:repartos_magsa/src/services/pedidos_services.dart';




class HomeServicioPage extends StatefulWidget {
  @override
  _HomeServicioPageState createState() => _HomeServicioPageState();
}

class _HomeServicioPageState extends State<HomeServicioPage> {


   bool unaVez = true;
  @override
  void didChangeDependencies() {
    if( unaVez ){
      User user = Provider.of<DatosUsuario>(context, listen: false).user;
      Provider.of<PedidosServices>(context, listen: false).init( user: user );
      unaVez = false;
    }
    super.didChangeDependencies();
  } 
  @override
  void dispose() {
    eliminarPedidos(); //LLAMAMOS A LA FUNCION REMOVER TODOS LOS PEDIDOS- LUEGO LANZAMOS EL DISPOSE EL ICONO DE CERRAR SESION 
    super.dispose();
  }

  void eliminarPedidos() => Provider.of<PedidosServices>(context, listen: false).removeAll();
  
  @override
  Widget build(BuildContext context) {

    User user = Provider.of<DatosUsuario>(context, listen: false).user;
    
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('${user.username}'),
          actions: <Widget>[
            // TODO CAMBIAR EL ICONO DE CERRAR SESION AL PERFIL
            IconButton(
              icon: Icon(Icons.exit_to_app, color: Colors.white),
              onPressed: (){
                DatosUsuario dataUserEmpty = DatosUsuario();
                dataUserEmpty.user = User()..role = Role();
                Provider.of<DatosUsuario>(context, listen: false).remplaceAll( dataUserEmpty );

                eliminarPedidos(); // AL CERRAR SESION SE ACTIVA EL DISPOSE 

                Navigator.of(context).pushNamedAndRemoveUntil('/welcomepage', ( _ )=> false);
              }
            ),
            IconButton(icon: Icon(Icons.person,color: Colors.white), onPressed: (){})
          ],
        ),
        body: _Paginas(),
        bottomNavigationBar: Navegacion(),
      ),
    );
  }
}

class Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return BottomNavigationBar(
        backgroundColor: Color(0xffFFBF00),
        selectedItemColor: Colors.black,
        selectedIconTheme: IconThemeData(color: Colors.black),
        currentIndex: navegacionModel.paginaActual,
        onTap: (i) => navegacionModel.paginaActual = i,
        items: [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.hourglassHalf),
              title: Text('Pendientes')),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.history),
              title: Text('Liquidados')),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.cog),
              title: Text('Ausentes')),
        ]);
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(
        context); //* PROVIDER QUE LLAMA A LA LISTA DE PAGINAS

    return PageView(
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        PendientesLiquidacionServicioPage(),
        PedidosLiquidadosServicioPage(),
        AusentesServicioPage()
      ],
    );
  }
}

//* CLASE CON PROVIDER PARA MANEJAR EL ESTADO DE LA PAGINA

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
