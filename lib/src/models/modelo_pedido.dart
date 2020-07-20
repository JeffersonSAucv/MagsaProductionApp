// To parse this JSON data, do
//
//     final pedidos = pedidosFromJson(jsonString);

import 'dart:convert';

List<Pedidos> pedidosFromJson(String str) =>
    List<Pedidos>.from(json.decode(str).map((x) => Pedidos.fromJson(x)));

String pedidosToJson(List<Pedidos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pedidos {
  Pedidos(
      {this.id,
      this.numeroGuia,
      this.departamento,
      this.fechaSegundaVisita,
      this.fechaEnLocal,
      this.fechaEntregado,
      this.telefonoConsultora,
      this.fechaPrimeraVisita,
      this.provincia,
      this.direccion,
      this.fechaEnRuta,
      this.distrito,
      this.nombreConsultora,
      this.codigoPedido,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.idCampania,
      this.idEstadoLiquidacion,
      this.idEvento,
      this.idSemana,
      this.idSucursal,
      this.idTiempoentrega,
      this.idUser,
      this.pedidoId,
      this.fechaDespacho});

  String id;
  String numeroGuia;
  String departamento;
  DateTime fechaSegundaVisita;
  DateTime fechaEnLocal;
  DateTime fechaEntregado;
  String telefonoConsultora;
  DateTime fechaPrimeraVisita;
  String provincia;
  String direccion;
  DateTime fechaEnRuta;
  String distrito;
  String nombreConsultora;
  String codigoPedido;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  Id idCampania;
  Id idEstadoLiquidacion;
  Id idEvento;
  Id idSemana;
  Id idSucursal;
  Id idTiempoentrega;
  IdUser idUser;
  String pedidoId;
  DateTime fechaDespacho;

  factory Pedidos.fromJson(Map<String, dynamic> json) => Pedidos(
        id: json["_id"] == null ? null : json["_id"],
        numeroGuia: json["numeroGuia"] == null ? null : json["numeroGuia"],
        departamento:
            json["departamento"] == null ? null : json["departamento"],
        fechaSegundaVisita: json["fechaSegundaVisita"] == null
            ? null
            : DateTime.tryParse(json["fechaEnRuta"]),
        fechaEnLocal: json["fechaEnLocal"] == null
            ? null
            : DateTime.parse(json["fechaEnLocal"]),
        fechaEntregado: json["fechaEntregado"] == null
            ? null
            : DateTime.parse(json["fechaEntregado"]),
        telefonoConsultora: json["telefonoConsultora"],
        fechaPrimeraVisita: json["fechaPrimeraVisita"] == null
            ? null
            : DateTime.parse(json["fechaPrimeraVisita"]),
        provincia: json["provincia"],
        direccion: json["direccion"],
        fechaEnRuta: json["fechaEnRuta"] == null
            ? null
            : DateTime.parse(json["fechaEnRuta"]),
        distrito: json["distrito"] == null ? null : json["distrito"],
        nombreConsultora:
            json["nombreConsultora"] == null ? null : json["nombreConsultora"],
        codigoPedido:
            json["codigoPedido"] == null ? null : json["codigoPedido"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        idCampania:
            json["idCampania"] == null ? null : Id.fromJson(json["idCampania"]),
        idEstadoLiquidacion: json["idEstadoLiquidacion"] == null
            ? null
            : Id.fromJson(json["idEstadoLiquidacion"]),
        idEvento:
            json["idEvento"] == null ? null : Id.fromJson(json["idEvento"]),
        idSemana:
            json["idSemana"] == null ? null : Id.fromJson(json["idSemana"]),
        idSucursal:
            json["idSemana"] == null ? null : Id.fromJson(json["idSemana"]),
        idTiempoentrega:
            json["idSemana"] == null ? null : Id.fromJson(json["idSemana"]),
        idUser:
            json["idSemana"] == null ? null : IdUser.fromJson(json["idSemana"]),
        pedidoId: json["id"] == null ? null : json["id"],
        fechaDespacho: json["fechaDespacho"] == null
            ? null
            : DateTime.parse(json["fechaDespacho"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "numeroGuia": numeroGuia,
        "departamento": departamento,
        "fechaSegundaVisita": fechaSegundaVisita.toIso8601String(),
        "fechaEnLocal": fechaEnLocal.toIso8601String(),
        "fechaEntregado": fechaEntregado.toIso8601String(),
        "telefonoConsultora": telefonoConsultora,
        "fechaPrimeraVisita": fechaPrimeraVisita.toIso8601String(),
        "provincia": provincia,
        "direccion": direccion,
        "fechaEnRuta": fechaEnRuta.toIso8601String(),
        "distrito": distrito,
        "nombreConsultora": nombreConsultora,
        "codigoPedido": codigoPedido,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "idCampania": idCampania.toJson(),
        "idEstadoLiquidacion": idEstadoLiquidacion.toJson(),
        "idEvento": idEvento.toJson(),
        "idSemana": idSemana.toJson(),
        "idSucursal": idSucursal.toJson(),
        "idTiempoentrega": idTiempoentrega.toJson(),
        "idUser": idUser.toJson(),
        "id": pedidoId,
        "fechaDespacho": fechaDespacho.toIso8601String()
      };
}

class Id {
  Id({
    this.id,
    this.descripCampania,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.idId,
    this.descripEstadoLiq,
    this.descripcionEstado,
    this.descripRemesa,
    this.nombreSucursal,
    this.diasTiempoEntrega,
  });

  String id;
  String descripCampania;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String idId;
  String descripEstadoLiq;
  String descripcionEstado;
  String descripRemesa;
  String nombreSucursal;
  String diasTiempoEntrega;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        id: json["_id"] == null ? null : json["_id"],
        descripCampania:
            json["descripCampania"] == null ? null : json["descripCampania"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        idId: json["id"] == null ? null : json["id"],
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
        "_id": id,
        "descripCampania": descripCampania == null ? null : descripCampania,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "id": idId,
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
  IdUser({
    this.confirmed,
    this.blocked,
    this.id,
    this.username,
    this.email,
    this.provider,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.role,
    this.idUserId,
  });

  bool confirmed;
  bool blocked;
  String id;
  String username;
  String email;
  String provider;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String role;
  String idUserId;

  factory IdUser.fromJson(Map<String, dynamic> json) => IdUser(
        confirmed: json["confirmed"] == null ? null : json["confirmed"],
        blocked: json["blocked"] == null ? null : json["blocked"],
        id: json["_id"] == null ? null : json["_id"],
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        provider: json["provider"] == null ? null : json["provider"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        role: json["role"] == null ? null : json["role"],
        idUserId: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "confirmed": confirmed,
        "blocked": blocked,
        "_id": id,
        "username": username,
        "email": email,
        "provider": provider,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "role": role,
        "id": idUserId,
      };
}
