// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

HistoryModel historyModelFromJson(String str) =>
    HistoryModel.fromJson(json.decode(str));

String historyModelToJson(HistoryModel data) => json.encode(data.toJson());

class HistoryModel {
  int? appointmentId;
  DateTime? day;
  String? specialization;
  String? doctorName;
  String? appointmentState;

  HistoryModel({
    this.day,
    this.specialization,
    this.doctorName,
    this.appointmentState,
    this.appointmentId,
  });

  factory HistoryModel.fromJson(Map<dynamic, dynamic> json) => HistoryModel(
        appointmentId: json["appointmentCode"],
        day: json["day"] == null ? null : DateTime.parse(json["day"]),
        specialization: json["specialization"],
        doctorName: json["doctorName"],
        appointmentState: json["appointmentState"],
      );

  Map<String, dynamic> toJson() => {
        "appointmentCode": appointmentId,
        "day": day?.toIso8601String(),
        "specialization": specialization,
        "doctorName": doctorName,
        "appointmentState": appointmentState,
      };
}
