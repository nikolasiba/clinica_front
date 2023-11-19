import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinica/_clinica/login/presentation/controller/login_ctr.dart';

import 'package:clinica/shared/assets/assets.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/custom_button.dart';
import 'package:clinica/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecoverPassworPage extends StatefulWidget {
  const RecoverPassworPage({super.key});

  @override
  State<RecoverPassworPage> createState() => _RecoverPassworPageState();
}

class _RecoverPassworPageState extends State<RecoverPassworPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context);
    final responsive = Responsive(context);
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
          left: responsive.width * .04,
          top: responsive.height * .2,
          child: Container(
            padding: const EdgeInsets.all(20),
            height: responsive.height * .6,
            width: responsive.width * .3,
            decoration: BoxDecoration(
              color: ConstColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AutoSizeText(
                  'Por favor ingresar el correo y la contraseña nueva para recuperar su cuenta',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: 'Email',
                  textColor: Colors.white,
                  textEditingController: controller.emailController,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                    textColor: Colors.white,
                    hintText: 'Nueva contraseña',
                    textEditingController: controller.passwordController),
                const SizedBox(height: 20),
                CustomTextField(
                    textColor: Colors.white,
                    hintText: 'Repetir contraseña',
                    textEditingController: controller.repeatPasswordController),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPressed: () async {
                    await controller.changePasword(context);
                  },
                  text: 'Recuperar',
                  backgroundColor: Colors.white,
                  width: responsive.width * 0.2,
                  colorContent: ConstColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
