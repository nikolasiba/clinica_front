import 'package:clinica/_clinica/services/apis/apis.dart';
import 'package:clinica/_clinica/services/data/remote/error/network_error.dart';
import 'package:clinica/_clinica/services/data/remote/network/network_api_service.dart';
import 'package:clinica/shared/util/preferences.dart';
import 'package:either_dart/either.dart';

import '../domain/interface/i_appoinment.dart';

class AppoinmentRepository implements IAppoinment {
  final prefs = Preferences();
  @override
  Future<Either<NetworkException, dynamic>> getMyAppointments(
      {required int patientCode}) async {
    var apiService = NetworkApiService();

    var headers = {'Authorization': 'Bearer ${prefs.token}'};

    String url = '${Apis.getMyAppointments}/$patientCode';

    dynamic response = await apiService.getResponse(url, headers: headers);
    return response;
  }

  @override
  Future<Either<NetworkException, dynamic>> getAvaliableAppoinments(
      {required String specialization}) async {
    var apiService = NetworkApiService();

    var headers = {'Authorization': 'Bearer ${prefs.token}'};

    String url =
        '${Apis.getAvailableAppoinments}?specialization=$specialization&doctorState=AVAILABLE';

    dynamic response = await apiService.getResponse(url, headers: headers);
    return response;
  }

  @override
  Future<Either<NetworkException, dynamic>> createAppoinment(
      {required Object data}) async {
    var apiService = NetworkApiService();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${prefs.token}'
    };

    String url = Apis.createAppoinment;

    dynamic response =
        await apiService.postResponse(url, data, headers: headers);
    return response;
  }

  @override
  Future<Either<NetworkException, dynamic>> cancelAppoinment(
      {required int appoinmentCode}) async {
    var apiService = NetworkApiService();

    var headers = {'Authorization': 'Bearer ${prefs.token}'};

    String url = '${Apis.cancelAppoinment}/$appoinmentCode';

    dynamic response = await apiService.putResponse(url, {}, headers: headers);
    return response;
  }

  @override
  Future<Either<NetworkException, dynamic>> getHistory(
      {required int patientCode}) async {
    var apiService = NetworkApiService();

    var headers = {'Authorization': 'Bearer ${prefs.token}'};

    String url = '${Apis.getHistory}/$patientCode';

    dynamic response = await apiService.getResponse(url, headers: headers);
    return response;
  }

  @override
  Future<Either<NetworkException, dynamic>> attentionDetail(
      {required int appoinmentCode}) async {
    var apiService = NetworkApiService();

    var headers = {'Authorization': 'Bearer ${prefs.token}'};

    String url = '${Apis.attentionDetail}/$appoinmentCode';

    dynamic response = await apiService.getResponse(url, headers: headers);
    return response;
  }
}
