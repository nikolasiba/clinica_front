import 'package:clinica/_clinica/patient/petitions/domain/interface/i_petition.dart';
import 'package:clinica/_clinica/services/apis/apis.dart';
import 'package:clinica/_clinica/services/data/remote/error/network_error.dart';
import 'package:clinica/_clinica/services/data/remote/network/network_api_service.dart';
import 'package:clinica/shared/util/preferences.dart';
import 'package:either_dart/either.dart';

class PetitionReposisotry implements IPetition {
  final prefs = Preferences();

  @override
  Future createPetition({required Object data}) async {
    var apiService = NetworkApiService();

    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${prefs.token}",
    };

    String url = Apis.createPetition;

    dynamic response =
        await apiService.postResponse(url, data, headers: headers);

    return response;
  }

  @override
  Future<Either<NetworkException, dynamic>> getPetitions(
      {required int id}) async {
    var apiService = NetworkApiService();

    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${prefs.token}",
    };

    String url = '${Apis.getPetitions}/$id';

    dynamic response = await apiService.getResponse(url, headers: headers);

    return response;
  }

  @override
  Future<Either<NetworkException, dynamic>> getFinishedAppointments(
      {required int id}) async {
    var apiService = NetworkApiService();

    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${prefs.token}",
    };

    String url = '${Apis.getFinishedAppointments}/$id';

    dynamic response = await apiService.getResponse(url, headers: headers);

    return response;
  }
}
