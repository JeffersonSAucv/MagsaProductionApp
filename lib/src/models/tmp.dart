// To parse this JSON data, do
//
//     final pedidos = pedidosFromJson(jsonString);

import 'dart:convert';

List<Pedidos> pedidosFromJson(String str) =>
    List<Pedidos>.from(json.decode(str).map((x) => Pedidos.fromJson(x)));

String pedidosToJson(List<Pedidos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pedidos {
  String id;
  String codigoPedido;
  DateTime createdAt;
  DateTime updatedAt;
  String numeroGuia;
  String direccion;
  String nombreConsultora;
  DateTime fechaEnLocal;
  DateTime fechaEnRuta;
  dynamic fechaPrimeraVisita;
  DateTime fechaEntregado;
  dynamic fechaSegundaVisita;
  Id idSemana;
  Id idSucursal;
  Id idEvento;
  Id idEstadoliquidacion;
  Id idCampania;
  Id idTiempoentrega;
  String distrito;
  String provincia;
  String departamento;
  int telefonoConsultora;
  DateTime fechaDespacho;
  IdUser idUser;

  Pedidos(
      {this.id,
      this.codigoPedido,
      this.createdAt,
      this.updatedAt,
      this.numeroGuia,
      this.direccion,
      this.nombreConsultora,
      this.fechaEnLocal,
      this.fechaEnRuta,
      this.fechaPrimeraVisita,
      this.fechaEntregado,
      this.fechaSegundaVisita,
      this.idSemana,
      this.idSucursal,
      this.idEvento,
      this.idEstadoliquidacion,
      this.idCampania,
      this.idTiempoentrega,
      this.distrito,
      this.provincia,
      this.departamento,
      this.telefonoConsultora,
      this.idUser,
      this.fechaDespacho});

  factory Pedidos.fromJson(Map<String, dynamic> json) => Pedidos(
        id: json["_id"],
        codigoPedido: json["codigoPedido"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        numeroGuia: json["numeroGuia"],
        direccion: json["direccion"],
        nombreConsultora: json["nombreConsultora"],
        fechaEnLocal: json["fechaEnLocal"] == null
            ? null
            : DateTime.parse(json["fechaEnLocal"]),
        fechaEnRuta: json["fechaEnRuta"] == null
            ? null
            : DateTime.parse(json["fechaEnRuta"]),
        fechaPrimeraVisita: json["fechaPrimeraVisita"],
        fechaEntregado: json["fechaEntregado"] == null
            ? null
            : DateTime.parse(json["fechaEntregado"]),
        fechaSegundaVisita: json["fechaSegundaVisita"] == null
            ? null
            : json["fechaSegundaVisita"],
        idSemana: Id.fromJson(json["idRemesa"]),
        idSucursal: Id.fromJson(json["idSucursal"]),
        idEvento: Id.fromJson(json["idEvento"]),
        idEstadoliquidacion: Id.fromJson(json["idEstadoliquidacion"]),
        idCampania: Id.fromJson(json["idSemana"]),
        idTiempoentrega: Id.fromJson(json["idTiempoentrega"]),
        distrito: json["distrito"],
        provincia: json["provincia"],
        departamento: json["departamento"],
        telefonoConsultora: json["telefonoConsultora"],
        idUser: json["idUser"] == null ? null : IdUser.fromJson(json["idUser"]),
        fechaDespacho: json["fechaDespacho"] == null
            ? null
            : DateTime.parse(json["fechaDespacho"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "codigoPedido": codigoPedido,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "numeroGuia": numeroGuia,
        "Direccion": direccion,
        "nombreConsultora": nombreConsultora,
        "fechaEnLocal": fechaEnLocal.toIso8601String(),
        "fechaEnRuta": fechaEnRuta.toIso8601String(),
        "fechaPrimeraVisita": fechaPrimeraVisita,
        "fechaEntregado":
            fechaEntregado == null ? null : fechaEntregado.toIso8601String(),
        "fechaSegundaVisita": fechaSegundaVisita,
        "idRemesa": idSemana.toJson(),
        "idSucursal": idSucursal.toJson(),
        "idEvento": idEvento.toJson(),
        "idEstadoliquidacion": idEstadoliquidacion.toJson(),
        "idCampania": idCampania.toJson(),
        "idTiempoentrega": idTiempoentrega.toJson(),
        "Distrito": distrito,
        "Provincia": provincia,
        "Departamento": departamento,
        "TelefonoConsultora": telefonoConsultora,
        "idUser": idUser == null ? null : idUser.toJson(),
        "fechaDespacho": fechaDespacho.toIso8601String()
      };
}

class Id {
  String id;
  String descripCamapania;
  DateTime createdAt;
  DateTime updatedAt;
  String descripEstadoLiq;
  String descripcionEstado;
  String descripRemesa;
  String nombreSucursal;
  String diasTiempoEntrega;

  Id({
    this.id,
    this.descripCamapania,
    this.createdAt,
    this.updatedAt,
    this.descripEstadoLiq,
    this.descripcionEstado,
    this.descripRemesa,
    this.nombreSucursal,
    this.diasTiempoEntrega,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        id: json["id"],
        descripCamapania:
            json["descripCamapania"] == null ? null : json["descripCamapania"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        descripEstadoLiq:
            json["descripEstadoLiq"] == null ? null : json["descripEstadoLiq"],
        descripcionEstado: json["descripcionEstado"] == null
            ? null
            : json["descripcionEstado"],
        descripRemesa:
            json["descripRemesa"] == null ? null : json["descripRemesa"],
        nombreSucursal:
            json["nombreSucursal"] == null ? null : json["nombreSucursal"],
        diasTiempoEntrega: json["diasTiempoEntrega"] == null
            ? null
            : json["diasTiempoEntrega"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripCamapania": descripCamapania == null ? null : descripCamapania,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "descripEstadoLiq": descripEstadoLiq == null ? null : descripEstadoLiq,
        "descripcionEstado":
            descripcionEstado == null ? null : descripcionEstado,
        "descripRemesa": descripRemesa == null ? null : descripRemesa,
        "nombreSucursal": nombreSucursal == null ? null : nombreSucursal,
        "diasTiempoEntrega":
            diasTiempoEntrega == null ? null : diasTiempoEntrega,
      };
}

class IdUser {
  String id;
  String username;
  String email;
  String provider;
  bool confirmed;
  bool blocked;
  int role;
  DateTime createdAt;
  DateTime updatedAt;
  int dni;
  int numeroCelular;
  dynamic direccion;
  int idVehiculo;

  IdUser({
    this.id,
    this.username,
    this.email,
    this.provider,
    this.confirmed,
    this.blocked,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.dni,
    this.numeroCelular,
    this.direccion,
    this.idVehiculo,
  });

  factory IdUser.fromJson(Map<String, dynamic> json) => IdUser(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        provider: json["provider"],
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        dni: json["dni"],
        numeroCelular: json["numeroCelular"],
        direccion: json["direccion"],
        idVehiculo: json["idVehiculo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "provider": provider,
        "confirmed": confirmed,
        "blocked": blocked,
        "role": role,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "dni": dni,
        "numeroCelular": numeroCelular,
        "direccion": direccion,
        "idVehiculo": idVehiculo,
      };
}
