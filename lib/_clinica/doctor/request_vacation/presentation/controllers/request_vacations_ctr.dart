import 'dart:developer';

import 'package:clinica/_clinica/doctor/request_vacation/repository/request_vacations_repo.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

import '../../../../../locator.dart';
import '../../../../../shared/util/utils.dart';
import '../../../../login/domain/model/user_model.dart';
import '../../../../services/navigation_service.dart';
import '../../domain/service/request_vacations_service.dart';

class RequestVacationsController extends ChangeNotifier {
  DateTime initialDate = DateTime.now();
  DateTime finalDate = DateTime.now();
  final ValueNotifier<DateTime> selectedDate =
      ValueNotifier<DateTime>(DateTime.now());
  final RequestVacationsService requestVacationsService =
      RequestVacationsService(RequestVacationsRepository());

  Future<void> requestVacations() async {
    UserModel user = Utils.data.getUser();

    var objetc = {
      "day": selectedDate.value.day,
      "doctorCode": user.id,
    };
    try {
      Either response =
          await requestVacationsService.requestVacations(data: objetc);
      log(response.toString());
      if (response.isRight) {
        Utils.device.showDialogCustom(
            context: locator<NavigationService>().navigatorKey.currentContext!,
            message: 'Dia libre solicitado correctamente',
            onRightPressed: () {
              locator<NavigationService>().navigateTo('/manage_agenda');
            });
      } else {
        Utils.device.showDialogCustom(
            context: locator<NavigationService>().navigatorKey.currentContext!,
            message: response.left.message,
            onRightPressed: () {
              locator<NavigationService>().navigateTo('/manage_agenda');
            });
      }
    } catch (e) {
      Utils.device.showDialogCustom(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          message: 'No se pudo realizar la solicitud del dia libre',
          onRightPressed: () {
            locator<NavigationService>().navigateTo('/manage_agenda');
          });
    }
  }
}
