import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:provider/provider.dart'; //LIBERIA PROVIDER
import 'package:repartos_magsa/src/models/modelo_pedido.dart';
import 'package:repartos_magsa/src/models/modelo_usuario.dart';

//PAGINA DEL MENU
import 'package:repartos_magsa/src/pages/pages_proveedor/enruta_pages.dart';
import 'package:repartos_magsa/src/pages/pages_proveedor/historialproveedor.dart';
import 'package:repartos_magsa/src/pages/pages_proveedor/pendientesliquidar_page.dart';
import 'package:repartos_magsa/src/services/pedidos_services.dart';


class HomeProveedorPage extends StatefulWidget {

  @override
  _HomeProveedorPageState createState() => _HomeProveedorPageState();
}

class _HomeProveedorPageState extends State<HomeProveedorPage> {

  
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
    Provider.of<PedidosServices>(context, listen: false).removeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<DatosUsuario>(context, listen: false).user;

    return ChangeNotifierProvider(
        create: (_)=> new _NavegacionModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('${user.username}'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.exit_to_app, color: Colors.white),
                 onPressed: (){
                  DatosUsuario dataUserEmpty = DatosUsuario();
                  dataUserEmpty.user = User()..role = Role();
                  Provider.of<DatosUsuario>(context, listen: false).remplaceAll( dataUserEmpty );
                  Navigator.of(context).pushNamedAndRemoveUntil('/welcomepage', ( _ )=> false);
                }
              )
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

    final  navegacionModel = Provider.of<_NavegacionModel>(context);
    return BottomNavigationBar(
    
      backgroundColor: Color(0xffFFBF00),
      selectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(color: Colors.black),
      currentIndex: navegacionModel.paginaActual,
      onTap: (i)=>navegacionModel.paginaActual = i,
      items: [

        BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.truck,),title: Text('En Rutas')), 
        BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.hourglassHalf),title: Text('Pendientes')),
        BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.history),title: Text('Entregados')),
      
      ]
      
    );
  }
}

class _Paginas extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    

    final  navegacionModel = Provider.of<_NavegacionModel>(context);  //* PROVIDER QUE LLAMA A LA LISTA DE PAGINAS

    return PageView(
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        EnRutaPage(),
        PedidosPendientesLiquidacionPage(),
        HistorialPedidosProveedorPage()
      ],
    );
  }
}

//* CLASE CON PROVIDER PARA MANEJAR EL ESTADO DE LA PAGINA

class _NavegacionModel with ChangeNotifier{
  int _paginaActual = 0;
  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;

  set paginaActual( int valor){
    this._paginaActual = valor;
    _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController  get pageController  => this._pageController;
}