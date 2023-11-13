import 'package:clinica/_clinica/patient/petitions/presentation/controller/petition_ctrl.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetitionPage extends StatelessWidget {
  const PetitionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => PetitionController(), child: _PetitionBody());
  }
}

class _PetitionBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppMenu(),
        backgroundColor: ConstColors.primaryColor,
        leading: Container(),
      ),
      backgroundColor: Colors.grey[300],
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
