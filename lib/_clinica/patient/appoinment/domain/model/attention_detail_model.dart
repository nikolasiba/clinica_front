import 'dart:convert';

// To parse this JSON data, do
AttentionDetailModel attentionDetailModelFromJson(String str) =>
    AttentionDetailModel.fromJson(json.decode(str));

String attentionDetailModelToJson(AttentionDetailModel data) =>
    json.encode(data.toJson());

class AttentionDetailModel {
  int? codeAttention;
  String? diagnosis;
  String? treatment;
  String? medicalNotes;
  int? codeAppointment;
  String? appointmentState;

  AttentionDetailModel({
    this.codeAttention,
    this.diagnosis,
    this.treatment,
    this.medicalNotes,
    this.codeAppointment,
    this.appointmentState,
  });

  factory AttentionDetailModel.fromJson(Map<String, dynamic> json) =>
      AttentionDetailModel(
        codeAttention: json["codeAttention"],
        diagnosis: json["diagnosis"],
        treatment: json["treatment"],
        medicalNotes: json["medicalNotes"],
        codeAppointment: json["codeAppointment"],
        appointmentState: json["appointmentState"],
      );

  Map<String, dynamic> toJson() => {
        "codeAttention": codeAttention,
        "diagnosis": diagnosis,
        "treatment": treatment,
        "medicalNotes": medicalNotes,
        "codeAppointment": codeAppointment,
        "appointmentState": appointmentState,
      };
}
