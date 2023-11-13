import 'dart:developer';

import 'package:clinica/_clinica/login/domain/service/login_service.dart';
import 'package:clinica/_clinica/login/repository/login_repository.dart';
import 'package:clinica/_clinica/services/navigation_service.dart';
import 'package:clinica/locator.dart';
import 'package:clinica/shared/util/preferences.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final prefs = Preferences();

  final LoginService _loginService = LoginService(LoginRepository());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    bool response = await _loginService.login();

    prefs.role = 'paciente';
    log(prefs.role);

    if (response && prefs.role == 'paciente') {
      locator<NavigationService>().navigateTo('/profile');
    }
  }
}
