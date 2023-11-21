import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:clinica/_clinica/data_clinic/domain/service/clinic_service.dart';
import 'package:clinica/_clinica/data_clinic/repository/clinic_repository.dart';
import 'package:clinica/_clinica/login/domain/model/register.dart';
import 'package:clinica/_clinica/login/domain/service/login_service.dart';
import 'package:clinica/_clinica/login/repository/login_repository.dart';
import 'package:clinica/_clinica/services/navigation_service.dart';
import 'package:clinica/locator.dart';
import 'package:clinica/shared/util/preferences.dart';
import 'package:clinica/shared/util/utils.dart';
import 'package:either_dart/either.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginController extends ChangeNotifier {
  final prefs = Preferences();

  File? imageFile;

  final LoginService _loginService = LoginService(LoginRepository());
  final ClinicService clinicService = ClinicService(ClinicRepository());
  //login
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  //selects
  List cities = [];
  List bloodTypes = [];
  List eps = [];
  String selectedCity = 'Seleccione una ciudad';
  String selectedBloodType = 'Seleccione un tipo de sangre';
  String selectedEps = 'Seleccione una EPS';

  //register
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController allergiesController = TextEditingController();
  TextEditingController emailRegisterController = TextEditingController();
  TextEditingController passwordRegisterController = TextEditingController();
  //
  //
  Future<void> login(context) async {
    Either response = await _loginService.login(
        email: emailController.text, password: passwordController.text);

    if (response.isRight) {
      log(response.right.toString());
      prefs.token = response.right['response']['token'];
      Map token = JwtDecoder.decode(prefs.token);
      prefs.role = token['rol'];
      String route = '';
      if (prefs.role == 'Patient') {
        route = '/profile';
      } else if (prefs.role == 'Doctor') {
        route = '/manage_agenda';
      }

      if (route.isNotEmpty) {
        locator<NavigationService>().navigateTo(route);
      } else {
        Utils.device.showDialogCustom(
            context: context,
            message: 'yo are not a patient or doctor',
            title: 'Error',
            onRightPressed: () {
              clearFields();
              Navigator.pop(context);
            });
      }
    } else {
      Utils.device.showDialogCustom(
          context: context,
          message: response.left.message,
          title: 'Error',
          onRightPressed: () {
            Navigator.pop(context);
          });
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

  Future<void> singIn(context) async {
    RegisterModel registerModel = RegisterModel(
      name: nameController.text,
      identification: int.parse(idController.text),
      phone: phoneController.text,
      city: selectedCity,
      birthday: birthdayController.text,
      allergies: allergiesController.text,
      eps: selectedEps,
      bloodType: selectedBloodType,
      email: emailRegisterController.text,
      password: passwordRegisterController.text,
      urlPicture: Utils.data.consecutive(),
    );

    Either response = await _loginService.singIn(registerModel: registerModel);

    if (response.isRight) {
      Utils.device.showDialogCustom(
          context: context,
          message: 'Acount created',
          title: 'Succes',
          onRightPressed: () {
            clearFields();
            Navigator.pop(context);
            Navigator.pop(context);
          });
    } else {
      Utils.device
          .showDialogCustom(context: context, message: response.left.message);
    }
  }

  clearFields() {
    nameController.text = '';
    idController.text = '';
    phoneController.text = '';
    selectedCity = 'Seleccione una ciudad';
    birthdayController.text = '';
    allergiesController.text = '';
    selectedEps = 'Seleccione una EPS';
    selectedBloodType = 'Seleccione un tipo de sangre';
    emailRegisterController.text = '';
    passwordRegisterController.text = '';
  }

  Future<void> changePasword(BuildContext context) async {
    Either response = await _loginService.changePassword(
        email: emailController.text,
        password: passwordController.text,
        newPassword: repeatPasswordController.text);

    if (response.isRight) {
      Future.delayed(
          const Duration(milliseconds: 300),
          () => Utils.device.showDialogCustom(
              context: context,
              message: 'Password changed',
              title: 'Succes',
              onRightPressed: () {
                clearFields();
                Navigator.pop(context);
                Navigator.pop(context);
              }));
    } else {
      Future.delayed(
          const Duration(milliseconds: 300),
          () => Utils.device.showDialogCustom(
              context: context, message: response.left.message));
    }
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

  Future<void> getInitialData() async {
    await getCities();
    await getBloodTypes();
    await getEps();
  }

  void pickedFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      final Uint8List bytes = result.files.single.bytes!;
      imageFile = File.fromRawPath(bytes);
      await uploadPicture();
    }
  }

  Future<void> uploadPicture() async {
    if (imageFile == null) {
      Utils.device.showDialogCustom(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          message: 'Debe seleccionar una imagen');
      return;
    }
    Either response = await _loginService.uploadPictur(file: imageFile!);
    if (response.isRight) {
      Utils.device.showDialogCustom(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          message: 'Imagen subida con exito');
    } else {
      Utils.device.showDialogCustom(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          message: response.left.message);
    }
  }
}
