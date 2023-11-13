import 'dart:developer';

import 'package:clinica/_clinica/login/domain/service/login_service.dart';
import 'package:clinica/_clinica/login/repository/login_repository.dart';
import 'package:clinica/_clinica/services/navigation_service.dart';
import 'package:clinica/locator.dart';
import 'package:clinica/shared/util/preferences.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final prefs = Preferences();

  final LoginService _loginService = LoginService(LoginRepository());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    Either response = await _loginService.login(
        email: emailController.text, password: passwordController.text);

    if (response.isRight) {
      log(response.right.toString());
      prefs.role = 'paciente';
      log(prefs.role);
      locator<NavigationService>().navigateTo('/profile');
    }
  }
}
