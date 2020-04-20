import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:repartos_magsa/src/models/modelo_pedido.dart';
import 'package:http/http.dart' as http;
import 'package:repartos_magsa/src/models/modelo_usuario.dart';
import 'package:repartos_magsa/src/pages/pages_consultarpedido/consultarpedidoform_page.dart';
import 'package:repartos_magsa/utils/constants.dart';

final _api = 'https://magsa-backend-postgresql.herokuapp.com';

class PedidosServices with ChangeNotifier{

  List<Pedidos> pedidos = [];                     //Pedidos Proveedor
  List<Pedidos> pedidosPendientes = [];           //Pedidos Proveedor
  List<Pedidos> historialPedidos = [];            //Pedidos Proveedor
  List<Pedidos> pendientesLiquidarServicio = [];  //Pedidos Servicio
  List<Pedidos> liquidadosServicio= [];  
  List<Pedidos> pedidosAusentes = [];        //Pedidos Servicio
  List<Pedidos> detalleSeguimientoPedido = [];        //Pedidos Servicio

  bool _buscandoPedido= false;

  bool get buscandoPedido => this._buscandoPedido;



  void init({ User user }){
    this.getPedidosEnRutaProveedor( user: user );
    this.getPedidosPendientesProveedor( user: user );
    this.getHistorialPedidosProveedor( user: user );
    this.getPendientesLiquidacionServicio( user: user );
    this.getHistorialLiquidacionServicio( user: user );
    this.getAusentesServicio(user: user);
  }

  void removeAll(){
    pedidos.clear();
    pedidosPendientes.clear();
    historialPedidos.clear();
    pendientesLiquidarServicio.clear();
    liquidadosServicio.clear();
    pedidosAusentes.clear();
  }
  
  void initConsultaPedido(){

    this.getDetalleSeguimientoPedidoConsultora();
  }

  void removerConsultaPedido(){
    //detalleSeguimientoPedido.clear();
    detalleSeguimientoPedido.clear();

  }
  // API PEDIDOS EN RUTA  PROVEEDOR

  void getPedidosEnRutaProveedor({ User user }) async {  // OBTENEROS LOS DATOS DEL USER REGISTRADO
    final url = '$_api/pedidos?idUser.id_eq=${user.id}&idEvento=2&idEstadoliquidacion=2';
    final resp = await http.get(url);
    final pedidosResponse =  pedidosFromJson(resp.body);
    print('PEDIDO CONSULTADO ${resp.body}');
    this.pedidos.addAll(pedidosResponse);
    notifyListeners();

  }

  // API PEDIDOS PENDIENTES PROVEEDOR

  void getPedidosPendientesProveedor({ User user }) async {
    final url = '$_api/pedidos?idUser.id_eq=${user.id}&idEvento=3&idEstadoliquidacion=2';
    final resp = await http.get(url);
    final pedidosResponse =  pedidosFromJson(resp.body);
    this.pedidosPendientes.addAll(pedidosResponse);
    notifyListeners();

  }

    // API HISTORIAL  PEDIDOS PROVEEDOR


  void getHistorialPedidosProveedor({ User user }) async {
    final url = '$_api/pedidos?idUser.id_eq=${user.id}&idEvento=3&idEstadoliquidacion=3';
    final resp = await http.get(url);
    final pedidosResponse =  pedidosFromJson(resp.body);
    this.historialPedidos.addAll(pedidosResponse);
    notifyListeners();

  }

  // API QUE MUESTRA LOS PEDIDOS PENDIENTE DE LIQUIDACION DE SERVICIO 

  void getPendientesLiquidacionServicio({ User user }) async {
    final url = '$_api/pedidos?Departamento=${user.departamento}&idEvento=3&idEstadoliquidacion=2';
    final resp = await http.get(url);
    final pedidosResponse =  pedidosFromJson(resp.body);
    this.pendientesLiquidarServicio.addAll(pedidosResponse);
    notifyListeners();

  }

  // API QUE MUESTRA  LOS PEDIDOS LIQUIDADOS DE SERVICIO

  void getHistorialLiquidacionServicio({ User user }) async {
    final url = '$_api/pedidos?Departamento=${user.departamento}&idEvento=3&idEstadoliquidacion=3';
    final resp = await http.get(url);
    final pedidosResponse =  pedidosFromJson(resp.body);
    this.liquidadosServicio.addAll(pedidosResponse);
    notifyListeners();

  }

   // API QUE MUESTRA  LOS PEDIDOS AUSENTES DE SERVICIO

  void getAusentesServicio({ User user }) async {
    final url = '$_api/pedidos?idEvento=4&idEstadoliquidacion=2&Departamento=${user.departamento}';
    final resp = await http.get(url);
    final pedidosResponse =  pedidosFromJson(resp.body);
    this.pedidosAusentes.addAll(pedidosResponse);
    notifyListeners();

  }

  //API PARA CONSULTAR EL PEDIDO DE LA CONSULTORA
  void getDetalleSeguimientoPedidoConsultora() async {
    _buscandoPedido = true;
    notifyListeners();

    final url = '$_api/pedidos?codigoPedido=$numeropedido&Departamento=$departamenteSeleccionado';
    final resp = await http.get(url);
    final pedidosResponse =  pedidosFromJson(resp.body);
    this.detalleSeguimientoPedido.addAll(pedidosResponse);

    _buscandoPedido = false;
    notifyListeners();
  }

  


  //ACTUALIZAR EL PEDIDO DEL  A  ENTREGADO

  Future<bool> updatePedido({ Pedidos pedido, DatosUsuario user }) async {
    Dio dio = new Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer ${user.jwt}";
    Response response = await dio.put(
      ENTREGAR_PEDIDO_URL+'${pedido.id}',
      data: {
        'fechaPrimeraVisita' : DateTime.now().toString(),
        'idEvento': {
          "id": 3
        }
      }
    );

    if( response.statusCode == 200 ){
      return true;
    } else {
      return false;
    }

  }


  //PEDIDOS AUSENTES POR DEPARTAMENTO 
  //https://magsa-backend-postgresql.herokuapp.com/pedidos?idEvento=4&idEstadoliquidacion=2&Departamento=LAMBAYEQUE 


}