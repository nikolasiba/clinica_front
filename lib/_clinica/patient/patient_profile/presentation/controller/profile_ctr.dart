import 'package:clinica/_clinica/patient/patient_profile/domain/model/patient.dart';
import 'package:clinica/_clinica/patient/patient_profile/domain/service/patient_service.dart';
import 'package:clinica/_clinica/patient/patient_profile/repository/profile_p_repository.dart';
import 'package:clinica/shared/util/preferences.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class PatientProfileController extends ChangeNotifier {
  final prefs = Preferences();

  final PatientProfileService _patientService =
      PatientProfileService(ProfileRepository());

  PatientModel patientModel = PatientModel();

  Future<void> getPatientProfile() async {
    Map<String, dynamic> code = JwtDecoder.decode(prefs.token);

    Either response =
        await _patientService.getPatientProfile(code: code['id'].toString());
    if (response.isRight) {
      patientModel = PatientModel.fromJson(response.right);
      notifyListeners();
    }
  }
}
