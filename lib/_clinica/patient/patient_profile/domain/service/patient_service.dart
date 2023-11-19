import 'package:clinica/_clinica/patient/patient_profile/domain/interface/i_patient_pr.dart';
import 'package:clinica/_clinica/services/data/remote/error/network_error.dart';
import 'package:either_dart/either.dart';

class PatientProfileService {
  final IPatientProfile iPatientProfile;

  PatientProfileService(this.iPatientProfile);

  Future<Either<NetworkException, dynamic>> getPatientProfile(
      {required String code}) async {
    return await iPatientProfile.getPatientProfile(code: code);
  }

  Future<void> updatePatientProfile() async {
    return await iPatientProfile.updatePatientProfile();
  }

  Future<void> deletePatientProfile() async {
    return await iPatientProfile.deletePatientProfile();
  }
}
