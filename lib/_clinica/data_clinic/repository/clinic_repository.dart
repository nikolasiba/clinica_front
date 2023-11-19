import 'package:clinica/_clinica/data_clinic/domain/interface/i_clicnic.dart';
import 'package:clinica/_clinica/services/apis/apis.dart';
import 'package:clinica/_clinica/services/data/remote/error/network_error.dart';
import 'package:clinica/_clinica/services/data/remote/network/network_api_service.dart';
import 'package:either_dart/either.dart';

class ClinicRepository implements IClinic {
  @override
  Future<Either<NetworkException, dynamic>> getBloodTypes() async {
    var apiService = NetworkApiService();

    var headers = {"Content-Type": "application/json"};

    String url = Apis.getListBloodType;

    dynamic response = await apiService.getResponse(url, headers: headers);
    return response;
  }

  @override
  Future<Either<NetworkException, dynamic>> getCitis() async {
    var apiService = NetworkApiService();

    var headers = {"Content-Type": "application/json"};

    String url = Apis.getListCity;

    dynamic response = await apiService.getResponse(url, headers: headers);
    return response;
  }

  @override
  Future<Either<NetworkException, dynamic>> getEPS() async {
    var apiService = NetworkApiService();

    var headers = {"Content-Type": "application/json"};

    String url = Apis.getListEPS;

    dynamic response = await apiService.getResponse(url, headers: headers);
    return response;
  }

  @override
  Future<Either<NetworkException, dynamic>> getSpecialties() async {
    var apiService = NetworkApiService();

    var headers = {"Content-Type": "application/json"};

    String url = Apis.getListSpecialization;

    dynamic response = await apiService.getResponse(url, headers: headers);
    return response;
  }
}
