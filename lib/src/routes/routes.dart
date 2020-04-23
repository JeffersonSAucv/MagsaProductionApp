import 'package:flutter/material.dart';

import 'package:repartos_magsa/src/pages/homeproveedor_page.dart';
import 'package:repartos_magsa/src/pages/loginPage.dart';
import 'package:repartos_magsa/src/pages/pages_consultarpedido/consultarpedidoform_page.dart';
import 'package:repartos_magsa/src/pages/pages_consultarpedido/mostrardetalle_page.dart';
import 'package:repartos_magsa/src/pages/pages_proveedor/perfil_proveedor.dart';
import 'package:repartos_magsa/src/pages/pages_servicio/homepageservicio.dart';
import 'package:repartos_magsa/src/pages/welcome_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{

    // SE LLAMA A LA PROPIEDAD ESTATICA DE LA PAGINA,  PARA PODER HACER USO DE LOS SHARED PREFERENCES

    WelcomePage.routeName             :     ( BuildContext context ) => WelcomePage(),
    '/loginpage'                      :     ( BuildContext context ) => LoginPage(),
    '/consultarpedidoform'            :     ( BuildContext context ) => ConsultarPedidoForm(),
    HomeServicioPage.routeName        :     ( BuildContext context ) => HomeServicioPage(),
    HomeProveedorPage.routeName       :     ( BuildContext context ) => HomeProveedorPage(),
    '/mostrarpedidodetalle'           :     ( BuildContext context ) => MostrarDetallePedidoConsultoraPage(),
    '/perfilproveedor'                :     ( BuildContext context ) => PerfilProveedorPage()
  };
}