import 'package:flutter/material.dart';
import 'package:provider/provider.dart'
;
import 'package:repartos_magsa/src/models/modelo_usuario.dart';
import 'package:repartos_magsa/src/pages/uknow_page.dart';
import 'package:repartos_magsa/src/routes/routes.dart';
import 'package:repartos_magsa/src/services/pedidos_services.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: ( BuildContext context )=> new PedidosServices()),
            ChangeNotifierProvider(create: ( BuildContext context )=> new DatosUsuario()),
          ],
        child: MaterialApp(
        title: 'Repartos Magsa',
        theme: ThemeData(
          primaryIconTheme:  IconThemeData( color:  Color(0xff434343),),
          primaryColor: Color(0xff434343),
         ),
        routes: getApplicationRoutes(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/welcomepage',
        onUnknownRoute: (settings)=> MaterialPageRoute( builder: (BuildContext context) => UndefinePage()),
      ),
    );
  }
}