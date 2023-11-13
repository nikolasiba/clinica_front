import 'package:clinica/_clinica/patient/patient_profile/domain/interface/i_patient_pr.dart';

class PatientService {
  final IPatientProfile iPatientProfile;

  PatientService(this.iPatientProfile);

  Future<void> getPatientProfile() async {
    return await iPatientProfile.getPatientProfile();
  }

  Future<void> updatePatientProfile() async {
    return await iPatientProfile.updatePatientProfile();
  }

  Future<void> deletePatientProfile() async {
    return await iPatientProfile.deletePatientProfile();
  }
}
