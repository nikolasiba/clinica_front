import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/custom_app_menu.dart';
import 'package:clinica/shared/widgets/custom_button.dart';
import 'package:clinica/shared/widgets/separator.dart';
import 'package:flutter/material.dart';

class PatientAppoinmentPage extends StatelessWidget {
  const PatientAppoinmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: ConstColors.primaryColor,
        leading: Container(),
        title: CustomAppMenu(),
      ),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Separator(size: 2),
                  Container(
                    height: Responsive.of(context).height * .9,
                    width: Responsive.of(context).width * .85,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Icon(
                          Icons.person,
                          size: 150,
                          color: ConstColors.primaryColor,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Tus datos Personales',
                              style: TextStyle(
                                color: ConstColors.primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        const Separator(size: 4),
                        const Separator(size: 14),
                        const Spacer(),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomButton(
                            onPressed: () {},
                            text: 'Actualizar',
                            width: Responsive.of(context).width * .5,
                            backgroundColor: ConstColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Separator(size: 2),
                  Container(
                      color: ConstColors.primaryColor,
                      width: Responsive.of(context).width,
                      height: Responsive.of(context).height * .07)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
