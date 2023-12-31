import 'package:clinica/_clinica/login/domain/model/user_model.dart';
import 'package:clinica/_clinica/patient/appoinment/domain/model/history_model.dart';
import 'package:clinica/_clinica/patient/petitions/domain/model/petition_model.dart';
import 'package:clinica/_clinica/patient/petitions/domain/service/petition_service.dart';
import 'package:clinica/_clinica/patient/petitions/repository/petition_repo.dart';
import 'package:clinica/_clinica/services/navigation_service.dart';
import 'package:clinica/locator.dart';
import 'package:clinica/shared/util/utils.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

class PetitionController extends ChangeNotifier {
  final PetitionService petitionService =
      PetitionService(PetitionReposisotry());

  List<PetitionModel> petitions = [];
  List<HistoryModel> finishedAppointments = [];
  TextEditingController descriptionController = TextEditingController();

  Future getPetitions() async {
    UserModel user = Utils.data.getUser();

    Either response = await petitionService.getPetition(id: user.id!);

    if (response.isRight) {
      petitions = response.right
          .map<PetitionModel>((e) => PetitionModel.fromJson(e))
          .toList();
      notifyListeners();
    } else if (response.isLeft) {
      Utils.device.showDialogCustom(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          message: response.left.message);
    }
  }

  Future getFinishedAppointments() async {
    UserModel user = Utils.data.getUser();

    Either response =
        await petitionService.getFinishedAppointments(id: user.id!);

    if (response.isRight) {
      finishedAppointments = response.right
          .map<HistoryModel>((e) => HistoryModel.fromJson(e))
          .toList();
      notifyListeners();
      if (finishedAppointments.isNotEmpty) {
        locator<NavigationService>().navigateTo('/create_petition');
      } else {
        Utils.device.showDialogCustom(
            context: locator<NavigationService>().navigatorKey.currentContext!,
            message: 'No hay citas finalizadas para radicar peticiones');
      }
    } else {
      Utils.device.showDialogCustom(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          message: response.left.message);
    }
  }

  Future<void> createPetition(int appoinment) async {
    UserModel user = Utils.data.getUser();
    Object object = {
      "codeAppointment": appoinment,
      "reason": descriptionController.text,
      "typePetition": "REQUEST",
      "patientCode": user.id,
      "message": descriptionController.text
    };

    Either response = await petitionService.createPetition(object: object);
    if (response.isRight) {
      Utils.device.showDialogCustom(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          message: 'Peticion creada con exito');
    } else {
      Utils.device.showDialogCustom(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          message: response.left.message);
    }
  }
}
