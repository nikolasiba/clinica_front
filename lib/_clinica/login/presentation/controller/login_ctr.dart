import 'dart:developer';

import 'package:clinica/_clinica/login/domain/model/register.dart';
import 'package:clinica/_clinica/login/domain/service/login_service.dart';
import 'package:clinica/_clinica/login/repository/login_repository.dart';
import 'package:clinica/_clinica/services/navigation_service.dart';
import 'package:clinica/locator.dart';
import 'package:clinica/shared/util/preferences.dart';
import 'package:clinica/shared/util/utils.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginController extends ChangeNotifier {
  final prefs = Preferences();

  final LoginService _loginService = LoginService(LoginRepository());
  //login
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //register
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController allergiesController = TextEditingController();
  TextEditingController epsController = TextEditingController();
  TextEditingController bloodTypeController = TextEditingController();
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

      locator<NavigationService>().navigateTo('/profile');
    } else {
      Utils.device
          .showDialogCustom(context: context, message: response.left.message);
    }
  }

  Future<void> singIn(context) async {
    RegisterModel registerModel = RegisterModel(
      name: nameController.text,
      identification: int.parse(idController.text),
      phone: phoneController.text,
      city: cityController.text,
      birthday: birthdayController.text,
      allergies: allergiesController.text,
      eps: epsController.text,
      bloodType: bloodTypeController.text,
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
    cityController.text = '';
    birthdayController.text = '';
    allergiesController.text = '';
    epsController.text = '';
    bloodTypeController.text = '';
    emailRegisterController.text = '';
    passwordRegisterController.text = '';
  }
}
