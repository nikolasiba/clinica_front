import 'package:clinica/shared/util/preferences.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final prefs = Preferences();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<bool> login() async {
    await Future.delayed(const Duration(seconds: 2));
    prefs.role = 'paciente'; // 'paciente' or 'medico
    return true;
  }
}
