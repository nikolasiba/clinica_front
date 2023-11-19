// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? name;
  int? id;
  String? rol;
  String? email;

  UserModel({
    this.name,
    this.id,
    this.rol,
    this.email,
  });

  factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
        name: json["name"],
        id: json["id"],
        rol: json["rol"],
        email: json["sub"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "rol": rol,
        "sub": email,
      };
}
