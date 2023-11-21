import 'package:clinica/_clinica/patient/patient_profile/domain/interface/i_patient_pr.dart';
import 'package:clinica/_clinica/services/apis/apis.dart';
import 'package:clinica/_clinica/services/data/remote/error/network_error.dart';
import 'package:clinica/_clinica/services/data/remote/network/network_api_service.dart';
import 'package:clinica/shared/util/preferences.dart';
import 'package:either_dart/either.dart';

class ProfileRepository implements IPatientProfile {
  final prefs = Preferences();
  @override
  Future<void> deletePatientProfile() {
    throw UnimplementedError();
  }

  @override
  Future<Either<NetworkException, dynamic>> getPatientProfile(
      {required String code}) async {
    var apiService = NetworkApiService();

    var headers = {
      "Authorization": "Bearer ${prefs.token}",
    };

    String url = Apis.patientProfile + code;

    dynamic response = await apiService.getResponse(url, headers: headers);

    return response;
  }

  @override
  Future<Either<NetworkException, dynamic>> updatePatientProfile(
      {required Object object}) async {
    var apiService = NetworkApiService();

    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${prefs.token}",
    };

    String url = Apis.updatePatientProfile;

    dynamic response =
        await apiService.putResponse(url, object, headers: headers);

    return response;
  }
}
