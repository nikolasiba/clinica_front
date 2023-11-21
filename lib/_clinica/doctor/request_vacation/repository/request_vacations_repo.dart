import 'package:either_dart/either.dart';

import '../../../../shared/util/preferences.dart';
import '../../../services/apis/apis.dart';
import '../../../services/data/remote/error/network_error.dart';
import '../../../services/data/remote/network/network_api_service.dart';
import '../domain/interface/i_request_vacations.dart';

class RequestVacationsRepository implements IRequestVacations {
  final prefs = Preferences();

  @override
  Future<Either<NetworkException, dynamic>> requestVacations(
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
}
