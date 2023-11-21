// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

ManageAppointmentModel manageAppointmentFromJson(String str) =>
    ManageAppointmentModel.fromJson(json.decode(str));

String manageAppointmentToJson(ManageAppointmentModel data) =>
    json.encode(data.toJson());

class ManageAppointmentModel {
  int? appointmentId;
  DateTime? hour;
  String? appointmentState;
  String? patientName;
  int? patientId;

  ManageAppointmentModel({
    this.hour,
    this.patientName,
    this.appointmentState,
    this.appointmentId,
    this.patientId,
  });

  factory ManageAppointmentModel.fromJson(Map<dynamic, dynamic> json) =>
      ManageAppointmentModel(
        appointmentId: json["appointmentId"],
        patientName: json["patientName"],
        patientId: json["patientId"],
        hour: json["localDateTime"] == null
            ? null
            : DateTime.parse(json["localDateTime"]),
        appointmentState: json["appointmentState"],
      );

  Map<String, dynamic> toJson() => {
        "appointmentCode": appointmentId,
        "hour": hour?.toIso8601String(),
        "patientName": patientName,
        "appointmentState": appointmentState,
        "patientId": patientId,
      };
}
