import 'package:clinica/_clinica/doctor/attention_histoy/domain/interface/i_attention_history.dart';
import 'package:either_dart/either.dart';

import '../../../../shared/util/preferences.dart';
import '../../../services/apis/apis.dart';
import '../../../services/data/remote/error/network_error.dart';
import '../../../services/data/remote/network/network_api_service.dart';

class AttentionHistoryRepository implements IAttentionHistory {
  final prefs = Preferences();
  @override
  Future<Either<NetworkException, dynamic>> getAttentionHistory(
      {required int doctorCode}) async {
    var apiService = NetworkApiService();

    var headers = {'Authorization': 'Bearer ${prefs.token}'};

    String url = '${Apis.getListFinishedAndCancelledAppointments}/$doctorCode';

    dynamic response = await apiService.getResponse(url, headers: headers);
    return response;
  }
}
