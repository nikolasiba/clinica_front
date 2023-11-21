import 'package:clinica/_clinica/data_clinic/domain/service/clinic_service.dart';
import 'package:clinica/_clinica/data_clinic/repository/clinic_repository.dart';
import 'package:clinica/_clinica/login/domain/model/user_model.dart';
import 'package:clinica/_clinica/patient/patient_profile/domain/model/patient.dart';
import 'package:clinica/_clinica/patient/patient_profile/domain/service/patient_service.dart';
import 'package:clinica/_clinica/patient/patient_profile/repository/profile_p_repository.dart';
import 'package:clinica/_clinica/services/navigation_service.dart';
import 'package:clinica/locator.dart';
import 'package:clinica/shared/util/preferences.dart';
import 'package:clinica/shared/util/utils.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class PatientProfileController extends ChangeNotifier {
  final prefs = Preferences();

  final PatientProfileService _patientService =
      PatientProfileService(ProfileRepository());

  final ClinicService clinicService = ClinicService(ClinicRepository());

  List cities = [];
  List bloodTypes = [];
  List eps = [];
  String selectedCity = 'Seleccione una ciudad';
  String selectedBloodType = 'Seleccione un tipo de sangre';
  String selectedEps = 'Seleccione una EPS';
  //
  TextEditingController alergiesController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  PatientModel patientModel = PatientModel();

  Future<void> getPatientProfile() async {
    Map<String, dynamic> code = JwtDecoder.decode(prefs.token);

    Either response =
        await _patientService.getPatientProfile(code: code['id'].toString());
    if (response.isRight) {
      patientModel = PatientModel.fromJson(response.right);
      notifyListeners();
    }
  }

  Future<void> getData() async {
    await getCities();
    await getBloodTypes();
    await getEps();
    emailController.text = patientModel.email!;
    phoneController.text = patientModel.phone!;
    alergiesController.text = patientModel.allergies!;
    selectedCity = patientModel.city!;
    selectedBloodType = patientModel.bloodType!;
    selectedEps = patientModel.eps!;
    notifyListeners();
  }

  Future<void> getCities() async {
    Either response = await clinicService.getCitis();
    if (response.isRight) {
      cities = response.right;
      cities.insert(0, 'Seleccione una ciudad');
      notifyListeners();
    }
  }

  Future<void> getBloodTypes() async {
    Either response = await clinicService.getBloodTypes();
    if (response.isRight) {
      bloodTypes = response.right;
      bloodTypes.insert(0, 'Seleccione un tipo de sangre');
      notifyListeners();
    }
  }

  Future<void> getEps() async {
    Either response = await clinicService.getEPS();
    if (response.isRight) {
      eps = response.right;
      eps.insert(0, 'Seleccione una EPS');
      notifyListeners();
    }
  }

  customOnchanges(String value, int controller) {
    switch (controller) {
      case 1:
        selectedEps = value;
        break;
      case 2:
        selectedBloodType = value;
        break;
      case 3:
        selectedCity = value;
        break;
      default:
    }
    notifyListeners();
  }

  Future<void> updateData() async {
    if (selectedCity == 'Seleccione una ciudad' ||
        selectedBloodType == 'Seleccione un tipo de sangre' ||
        selectedEps == 'Seleccione una EPS') {
      Utils.device.showDialogCustom(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          message: 'Debe seleccionar una ciudad, un tipo de sangre y una EPS');
      return;
    }
    if (phoneController.text.isEmpty ||
        emailController.text.isEmpty ||
        alergiesController.text.isEmpty) {
      Utils.device.showDialogCustom(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          message: 'Por favor complete todos los campos');
      return;
    }

    UserModel userModel = Utils.data.getUser();
    var object = {
      "code": userModel.id,
      "identification": patientModel.identification,
      "name": patientModel.name,
      "phone": phoneController.text,
      "urlPicture": patientModel.urlPicture,
      "city": selectedCity,
      "birthday": patientModel.birthday,
      "allergies": alergiesController.text,
      "bloodType": selectedBloodType,
      "eps": selectedEps
    };
    Either response =
        await _patientService.updatePatientProfile(object: object);
    if (response.isRight) {
      Utils.device.showDialogCustom(
          title: 'Actualización exitosa',
          context: locator<NavigationService>().navigatorKey.currentContext!,
          message: 'Por favor inicia sesion de nuevo \n para ver los cambios',
          onRightPressed: () {
            locator<NavigationService>().navigateTo('login');
          });

      notifyListeners();
    }
  }
}
