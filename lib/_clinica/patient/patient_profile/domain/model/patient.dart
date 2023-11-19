// To parse this JSON data, do
//
//     final patientModel = patientModelFromJson(jsonString);

import 'dart:convert';

PatientModel patientModelFromJson(String str) =>
    PatientModel.fromJson(json.decode(str));

String patientModelToJson(PatientModel data) => json.encode(data.toJson());

class PatientModel {
  String? name;
  int? identification;
  String? phone;
  String? urlPicture;
  String? city;
  String? birthday;
  String? allergies;
  dynamic bloodType;
  String? eps;
  String? email;
  String? password;

  PatientModel({
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

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
        name: json["name"],
        identification: json["identification"],
        phone: json["phone"],
        urlPicture: json["urlPicture"],
        city: json["city"],
        birthday: json["birthday"],
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
