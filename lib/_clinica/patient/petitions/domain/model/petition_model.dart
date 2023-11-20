// To parse this JSON data, do
//
//     final petitionModel = petitionModelFromJson(jsonString);

import 'dart:convert';

PetitionModel petitionModelFromJson(String str) =>
    PetitionModel.fromJson(json.decode(str));

String petitionModelToJson(PetitionModel data) => json.encode(data.toJson());

class PetitionModel {
  int? codeAppointment;
  String? reason;
  String? typePetition;
  int? patientCode;
  List<dynamic>? message;
  String? specialty;
  String? petitionState;

  PetitionModel({
    this.codeAppointment,
    this.reason,
    this.typePetition,
    this.patientCode,
    this.message,
    this.specialty,
    this.petitionState,
  });

  factory PetitionModel.fromJson(Map<dynamic, dynamic> json) => PetitionModel(
        codeAppointment: json["codeAppointment"],
        reason: json["reason"],
        typePetition: json["typePetition"],
        patientCode: json["patientCode"],
        message: json["message"] == null
            ? []
            : List<dynamic>.from(json["message"]!.map((x) => x)),
        specialty: json["specialization"],
        petitionState: json["petitionState"],
      );

  Map<String, dynamic> toJson() => {
        "codeAppointment": codeAppointment,
        "reason": reason,
        "typePetition": typePetition,
        "patientCode": patientCode,
        "message":
            message == null ? [] : List<dynamic>.from(message!.map((x) => x)),
        "specialization": specialty,
        "petitionState": petitionState,
      };
}
