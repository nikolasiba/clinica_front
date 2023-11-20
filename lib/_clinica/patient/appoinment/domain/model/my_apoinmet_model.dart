// To parse this JSON data, do
//
//     final myAppointmentModel = myAppointmentModelFromJson(jsonString);

import 'dart:convert';

MyAppointmentModel myAppointmentModelFromJson(String str) =>
    MyAppointmentModel.fromJson(json.decode(str));

String myAppointmentModelToJson(MyAppointmentModel data) =>
    json.encode(data.toJson());

class MyAppointmentModel {
  int? appoinmentCode = 0;
  DateTime? day;
  String? initialTime;
  String? finalTime;
  String? eps;
  String? specialization;
  String? doctorName;

  MyAppointmentModel({
    this.appoinmentCode,
    this.day,
    this.initialTime,
    this.finalTime,
    this.eps,
    this.specialization,
    this.doctorName,
  });

  factory MyAppointmentModel.fromJson(Map<String, dynamic> json) =>
      MyAppointmentModel(
        appoinmentCode: json["appointmentCode"],
        day: json["day"] == null ? null : DateTime.parse(json["day"]),
        initialTime: json["initialTime"],
        finalTime: json["finalTime"],
        eps: json["eps"],
        specialization: json["specialization"],
        doctorName: json["doctorName"],
      );

  Map<String, dynamic> toJson() => {
        "appoinmentCode": appoinmentCode,
        "day": day?.toIso8601String(),
        "initialTime": initialTime,
        "finalTime": finalTime,
        "eps": eps,
        "specialization": specialization,
        "doctorName": doctorName,
      };
}
