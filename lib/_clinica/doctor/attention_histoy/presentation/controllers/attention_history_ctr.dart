import 'package:clinica/_clinica/doctor/attention_histoy/domain/services/attention_history_services.dart';
import 'package:clinica/_clinica/doctor/attention_histoy/repository/attention_history_repo.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/util/utils.dart';
import '../../../../login/domain/model/user_model.dart';
import '../../../manage_agenda/domain/model/manage_appointment_model.dart';

class AttentionHistoryController extends ChangeNotifier {
  List<ManageAppointmentModel> appoinmentsHistory = [];
  final AttentionHistoryServices attentionHistoryService =
      AttentionHistoryServices(AttentionHistoryRepository());

  Future<void> getAppoinments() async {
    UserModel user = Utils.data.getUser();
    Either response =
        await attentionHistoryService.getAttentionHistory(doctorCode: user.id!);
    if (response.isRight) {
      appoinmentsHistory = response.right
          .map<ManageAppointmentModel>(
              (e) => ManageAppointmentModel.fromJson(e))
          .toList();
      notifyListeners();
    }
  }
}
