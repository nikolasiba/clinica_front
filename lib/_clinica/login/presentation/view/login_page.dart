import 'package:clinica/_clinica/login/presentation/controller/login_ctr.dart';
import 'package:clinica/_clinica/services/navigation_service.dart';
import 'package:clinica/locator.dart';
import 'package:clinica/shared/assets/assets.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/custom_button.dart';
import 'package:clinica/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LoginController(), child: const _LoginBody());
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    final controller = Provider.of<LoginController>(context);

    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          width: responsive.width,
          height: responsive.height,
          child: Image.asset(
            Res.images.login,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          left: responsive.width * .03,
          top: responsive.height * .2,
          child: Container(
            padding: const EdgeInsets.all(20),
            height: responsive.height * .55,
            width: responsive.width * .35,
            decoration: BoxDecoration(
              color: ConstColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hintText: 'Email',
                    textColor: Colors.white,
                    textEditingController: controller.emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      textColor: Colors.white,
                      hintText: 'Password',
                      textEditingController: controller.passwordController),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    onPressed: () async {
                      await controller.login(context);
                    },
                    text: 'Log in',
                    backgroundColor: Colors.white,
                    width: responsive.width * 0.2,
                    colorContent: ConstColors.primaryColor,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          locator<NavigationService>()
                              .navigateTo('/recover_password');
                        },
                        child: const Text(
                          'forget password ?',
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline),
                        )),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          locator<NavigationService>().navigateTo('/register');
                        },
                        child: const Text(
                          'Sing in   ',
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
