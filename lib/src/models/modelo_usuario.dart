// To parse this JSON data, do
//
//     final datosUsuario = datosUsuarioFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

DatosUsuario datosUsuarioFromJson(String str) => DatosUsuario.fromJson(json.decode(str));

String datosUsuarioToJson(DatosUsuario data) => json.encode(data.toJson());

class DatosUsuario extends ChangeNotifier {
    String jwt;
    User user;

    DatosUsuario({
        this.jwt,
        this.user,
    });

    factory DatosUsuario.fromJson(Map<String, dynamic> json) => DatosUsuario(
        jwt: json["jwt"],
        user: User.fromJson(json),
    );

    Map<String, dynamic> toJson() => {
        "jwt": jwt,
        "user": user.toJson(),
    };

    void remplaceAll( DatosUsuario datosUsuarioNuevo ){
      this.jwt = datosUsuarioNuevo.jwt;
      this.user.remplaceAll( datosUsuarioNuevo.user );
    }

}

class User {
    int id;
    String username;
    String email;
    String provider;
    bool confirmed;
    bool blocked;
    Role role;
    DateTime createdAt;
    DateTime updatedAt;
    int dni;
    int numeroCelular;
    String direccion;
    String departamento;

    User({
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
        this.departamento,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id:                   json['user']["id"],
        username:             json['user']["username"],
        email:                json['user']["email"],
        provider:             json['user']["provider"],
        confirmed:            json['user']["confirmed"],
        blocked:              json['user']["blocked"],
        role:                 Role.fromJson(json),
        createdAt:            DateTime.parse(json['user']["created_at"]),
        updatedAt:            DateTime.parse(json['user']["updated_at"]),
        dni:                  json['user']["dni"],
        numeroCelular:        json['user']["numeroCelular"],
        direccion:            json['user']["direccion"],
        departamento:         json['user']["departamento"],

    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "provider": provider,
        "confirmed": confirmed,
        "blocked": blocked,
        "role": role.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "dni": dni,
        "numeroCelular": numeroCelular,
        "direccion": direccion,
        "departamento": departamento,
    };

    void remplaceAll( User userNuevo ){
        this.id            =       userNuevo.id;
        this.username      =       userNuevo.username;
        this.email         =       userNuevo.email;
        this.provider      =       userNuevo.provider;
        this.confirmed     =       userNuevo.confirmed;
        this.blocked       =       userNuevo.blocked;
        this.role.remplaceAll( userNuevo.role );
        this.createdAt     =       userNuevo.createdAt;
        this.updatedAt     =       userNuevo.updatedAt;
        this.dni           =       userNuevo.dni;
        this.numeroCelular =       userNuevo.numeroCelular;
        this.direccion     =       userNuevo.direccion;
        this.departamento  =       userNuevo.departamento;
    }
}

class Role {
    int id;
    String name;
    String description;
    String type;

    Role({
        this.id,
        this.name,
        this.description,
        this.type,
    });

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id:           json['user']['role']["id"],
        name:         json['user']['role']["name"],
        description:  json['user']['role']["description"],
        type:         json['user']['role']["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "type": type,
    };

    void remplaceAll( Role rolNuevo ){
        this.id            =       rolNuevo.id;
        this.name          =       rolNuevo.name;
        this.description   =       rolNuevo.description;
        this.type          =       rolNuevo.type;
    }
}
