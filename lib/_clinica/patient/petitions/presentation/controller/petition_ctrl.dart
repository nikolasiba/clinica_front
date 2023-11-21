import 'package:clinica/_clinica/login/domain/model/user_model.dart';
import 'package:clinica/_clinica/patient/petitions/domain/model/petition_model.dart';
import 'package:clinica/_clinica/patient/petitions/domain/service/petition_service.dart';
import 'package:clinica/_clinica/patient/petitions/repository/petition_repo.dart';
import 'package:clinica/locator.dart';
import 'package:clinica/shared/util/utils.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

class PetitionController extends ChangeNotifier {
  final PetitionService petitionService =
      PetitionService(PetitionReposisotry());

  List<PetitionModel> petitions = [];

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
          context: locator<GlobalKey<NavigatorState>>().currentContext!,
          message: response.left.message);
    }
  }
}
