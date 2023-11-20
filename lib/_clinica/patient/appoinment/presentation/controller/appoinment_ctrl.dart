import 'dart:developer';

import 'package:clinica/_clinica/data_clinic/domain/service/clinic_service.dart';
import 'package:clinica/_clinica/data_clinic/repository/clinic_repository.dart';
import 'package:clinica/_clinica/login/domain/model/user_model.dart';
import 'package:clinica/_clinica/patient/appoinment/domain/model/attention_detail_model.dart';
import 'package:clinica/_clinica/patient/appoinment/domain/model/available_apoinment_model.dart';
import 'package:clinica/_clinica/patient/appoinment/domain/model/history_model.dart';
import 'package:clinica/_clinica/patient/appoinment/domain/model/my_apoinmet_model.dart';
import 'package:clinica/_clinica/patient/appoinment/domain/service/appoinment_service.dart';
import 'package:clinica/_clinica/patient/appoinment/repository/appoinment_repo.dart';
import 'package:clinica/_clinica/services/navigation_service.dart';
import 'package:clinica/locator.dart';
import 'package:clinica/shared/util/utils.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

class AppoinmentController extends ChangeNotifier {
  final ClinicService clinicService = ClinicService(ClinicRepository());
  final AppoinmentService appoinmentService =
      AppoinmentService(AppoinmentRepository());

  List listSpecialization = [];
  String selectValue = 'Seleccione una especialidad';

  List<AvailableAppoinment> availableAppoinments = [];
  List<MyAppointmentModel> myAppoinments = [];
  List<HistoryModel> historyAppoinments = [];
  AttentionDetailModel attentionDetailModel = AttentionDetailModel();

  Future<void> getSpecialization() async {
    Either response = await clinicService.getSpecialties();
    if (response.isRight) {
      listSpecialization = response.right;
      listSpecialization.insert(0, 'Seleccione una especialidad');

      notifyListeners();
    }
  }

  Future<void> validateSpecilization(context) async {
    if (selectValue != 'Seleccione una especialidad') {
      await getAvailableAppoinments(selectValue);
      if (availableAppoinments.isNotEmpty) {
        locator<NavigationService>().navigateTo('/select_appoinment');
      } else {
        Utils.device.showDialogCustom(
            context: context, message: 'No hay citas disponibles');
      }
    } else {
      Utils.device.showDialogCustom(
          context: context, message: 'Por favor seleccione una especialidad');
    }
  }

  Future<void> getAvailableAppoinments(String data) async {
    Either response =
        await appoinmentService.getAvaliableAppoinments(specialization: data);
    if (response.isRight) {
      availableAppoinments = response.right['response']
          .map<AvailableAppoinment>((e) => AvailableAppoinment.fromJson(e))
          .toList();
      notifyListeners();
    }
  }

  changeSpecialization(String value) {
    selectValue = value;
    notifyListeners();
  }

  Future<void> requestAppoinment(AvailableAppoinment appoinment) async {
    UserModel user = Utils.data.getUser();

    var objetc = {
      "patientCode": user.id,
      "doctorCode": appoinment.doctorId,
      "scheduleCode": appoinment.code,
      "reason": "hola mundo"
    };
    Either response = await appoinmentService.createAppoinment(data: objetc);
    log(response.toString());
    if (response.isRight) {
      Utils.device.showDialogCustom(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          message: 'Cita solicitada correctamente',
          onRightPressed: () {
            locator<NavigationService>().navigateTo('/profile');
          });
    } else {
      Utils.device.showDialogCustom(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          message: response.left.message,
          onRightPressed: () {
            Navigator.pop(
                locator<NavigationService>().navigatorKey.currentContext!);
          });
    }
  }

  Future<void> getAppoinments() async {
    UserModel user = Utils.data.getUser();
    Either response =
        await appoinmentService.getMyAppointment(patientCode: user.id!);
    if (response.isRight) {
      myAppoinments = response.right
          .map<MyAppointmentModel>((e) => MyAppointmentModel.fromJson(e))
          .toList();
      notifyListeners();
    }
  }

  Future<void> cancelAppoinment(int code) async {
    Either response =
        await appoinmentService.cancelAppoinment(appoinmentCode: code);
    if (response.isRight) {
      await getAppoinments();
      Utils.device.showDialogCustom(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          message: 'Cita cancelada correctamente',
          onRightPressed: () {
            Navigator.pop(
                locator<NavigationService>().navigatorKey.currentContext!);
          });
    } else {
      Utils.device.showDialogCustom(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          message: response.left.message,
          onRightPressed: () {
            Navigator.pop(
                locator<NavigationService>().navigatorKey.currentContext!);
          });
    }
  }

  Future<void> getHistoryAppoinments() async {
    UserModel user = Utils.data.getUser();
    Either response = await appoinmentService.getHistory(patientCode: user.id!);
    if (response.isRight) {
      historyAppoinments = response.right
          .map<HistoryModel>((e) => HistoryModel.fromJson(e))
          .toList();
      notifyListeners();
      if (historyAppoinments.isEmpty) {
        Utils.device.showDialogCustom(
            context: locator<NavigationService>().navigatorKey.currentContext!,
            message: 'No tienes citas anteriores',
            onRightPressed: () {
              Navigator.pop(
                  locator<NavigationService>().navigatorKey.currentContext!);
            });
      } else {
        locator<NavigationService>().navigateTo('/history_appoinment');
      }
    } else {
      Utils.device.showDialogCustom(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          message: response.left.message,
          onRightPressed: () {
            Navigator.pop(
                locator<NavigationService>().navigatorKey.currentContext!);
          });
    }
  }

  Future<void> getAttentionDetail(int code) async {
    attentionDetailModel = AttentionDetailModel();
    Either response =
        await appoinmentService.attentionDetail(appoinmentCode: code);
    if (response.isRight) {
      attentionDetailModel = AttentionDetailModel.fromJson(response.right);
      notifyListeners();
    } else {
      Utils.device.showDialogCustom(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          message: response.left.message,
          onRightPressed: () {
            Navigator.pop(
                locator<NavigationService>().navigatorKey.currentContext!);
          });
    }
  }
}
