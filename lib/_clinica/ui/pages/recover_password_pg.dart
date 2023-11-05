import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinica/_clinica/services/navigation_service.dart';
import 'package:clinica/locator.dart';
import 'package:clinica/shared/assets/assets.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/custom_button.dart';
import 'package:clinica/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RecoverPassworPage extends StatelessWidget {
  const RecoverPassworPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            height: responsive.height * .4,
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
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: 'Email',
                  textColor: Colors.white,
                  textEditingController: TextEditingController(),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    textColor: Colors.white,
                    
                    hintText: 'Nueva contraseña',
                    textEditingController: TextEditingController()),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPressed: () {
                    locator<NavigationService>().navigateTo('/stateful');
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
