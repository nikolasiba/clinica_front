import 'package:clinica/_clinica/doctor/manage_agenda/domain/interface/i_manage_appointment.dart';
import 'package:clinica/_clinica/services/apis/apis.dart';
import 'package:clinica/_clinica/services/data/remote/error/network_error.dart';
import 'package:clinica/_clinica/services/data/remote/network/network_api_service.dart';
import 'package:clinica/shared/util/preferences.dart';
import 'package:either_dart/either.dart';

class ManageAppointmentRepository implements IManageAppointment {
  final prefs = Preferences();
  @override
  Future<Either<NetworkException, dynamic>> getAppointment(
      {required int doctorCode}) async {
    var apiService = NetworkApiService();

    var headers = {'Authorization': 'Bearer ${prefs.token}'};

    String url = '${Apis.getAppointmentToday}/$doctorCode';

    dynamic response = await apiService.getResponse(url, headers: headers);
    return response;
  }
}
