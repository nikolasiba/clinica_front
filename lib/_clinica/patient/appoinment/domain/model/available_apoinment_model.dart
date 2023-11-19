// To parse this JSON data, do
//
//     final availableAppoinment = availableAppoinmentFromJson(jsonString);

import 'dart:convert';

AvailableAppoinment availableAppoinmentFromJson(String str) =>
    AvailableAppoinment.fromJson(json.decode(str));

String availableAppoinmentToJson(AvailableAppoinment data) =>
    json.encode(data.toJson());

class AvailableAppoinment {
  int? code;
  DateTime? day;
  String? initialTime;
  String? finalTime;
  String? doctorName;
  String? scheduleState;
  int? doctorId;

  AvailableAppoinment({
    this.code,
    this.day,
    this.initialTime,
    this.finalTime,
    this.doctorName,
    this.scheduleState,
    this.doctorId,
  });

  factory AvailableAppoinment.fromJson(Map<String, dynamic> json) =>
      AvailableAppoinment(
        code: json["code"],
        day: json["day"] == null ? null : DateTime.parse(json["day"]),
        initialTime: json["initialTime"],
        finalTime: json["finalTime"],
        doctorName: json["doctorName"],
        scheduleState: json["scheduleState"],
        doctorId: json["doctorCode"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "day":
            "${day!.year.toString().padLeft(4, '0')}-${day!.month.toString().padLeft(2, '0')}-${day!.day.toString().padLeft(2, '0')}",
        "initialTime": initialTime,
        "finalTime": finalTime,
        "doctorName": doctorName,
        "scheduleState": scheduleState,
        "doctorId": doctorId,
      };
}
