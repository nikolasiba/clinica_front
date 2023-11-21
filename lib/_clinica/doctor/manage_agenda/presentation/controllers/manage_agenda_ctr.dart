import 'package:clinica/_clinica/doctor/manage_agenda/domain/model/manage_appointment_model.dart';
import 'package:clinica/_clinica/doctor/manage_agenda/domain/service/manage_appointment_service.dart';
import 'package:clinica/_clinica/doctor/manage_agenda/repository/manage_agenda_repo.dart';
import 'package:clinica/_clinica/login/domain/model/user_model.dart';
import 'package:clinica/shared/util/utils.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

class ManageAgendaController extends ChangeNotifier {
  List<ManageAppointmentModel> appoinmentsToday = [];
  final ManageAppointmentService appoinmentService =
      ManageAppointmentService(ManageAppointmentRepository());

  Future<void> getAppoinments() async {
    UserModel user = Utils.data.getUser();
    Either response =
        await appoinmentService.getAppointment(doctorCode: user.id!);
    if (response.isRight) {
      appoinmentsToday = response.right
          .map<ManageAppointmentModel>(
              (e) => ManageAppointmentModel.fromJson(e))
          .toList();
      notifyListeners();
    }
  }
}
