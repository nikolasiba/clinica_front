// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  String? name;
  int? identification;
  String? phone;
  String? urlPicture;
  String? city;
  String? birthday;
  String? allergies;
  String? bloodType;
  String? eps;
  String? email;
  String? password;

  RegisterModel({
    this.name,
    this.identification,
    this.phone,
    this.urlPicture,
    this.city,
    this.birthday,
    this.allergies,
    this.bloodType,
    this.eps,
    this.email,
    this.password,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        name: json["name"],
        identification: json["identification"],
        phone: json["phone"],
        urlPicture: json["urlPicture"],
        city: json["city"],
        birthday: (json["birthday"]),
        allergies: json["allergies"],
        bloodType: json["bloodType"],
        eps: json["eps"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "identification": identification,
        "phone": phone,
        "urlPicture": urlPicture,
        "city": city,
        "birthday": birthday.toString().substring(0, 10),
        "allergies": allergies,
        "bloodType": bloodType,
        "eps": eps,
        "email": email,
        "password": password,
      };
}
