import 'package:clinica/_clinica/doctor/start_day/presentation/controller/start_day_ctr.dart';
import 'package:clinica/_clinica/services/navigation_service.dart';
import 'package:clinica/locator.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/widgets/custom_alert.dart';
import 'package:clinica/shared/widgets/custom_page.dart';
import 'package:clinica/shared/widgets/separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartDayPage extends StatelessWidget {
  const StartDayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => StartDayController(), child: const _StartDayBody());
  }
}

class _StartDayBody extends StatelessWidget {
  const _StartDayBody();

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return CustomPage(
      innerContainer: true,
      body: CustomDialog(
        hasLeftButton: false,
        hasRightButton: true,
        hasRightButtonText: 'Aceptar',
        onRightPressed: () =>
            locator<NavigationService>().navigateTo('/manage_agenda'),
        title: Text('Iniciar Jornada',
            style: TextStyle(
              color: ConstColors.primaryColor,
=======
    return const CustomPage(
      body: CustomDialog(
        //Advertencia
        title: Text('No se que titulo ponerle a este dialogo',
            style: TextStyle(
              color: Colors.grey,
>>>>>>> b4f219e44d6ad8584fc743718097fbf525acf431
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        content: Padding(
<<<<<<< HEAD
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Turno',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Separator(
                  size: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Inicio:',
                      style: TextStyle(
                        color: ConstColors.secundayColor,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            '10/02/2021',
                            style: TextStyle(
                              color: ConstColors.secundayColor,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Text(
                          '02:00',
                          style: TextStyle(
                            color: ConstColors.secundayColor,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Separator(
                  size: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fin:',
                      style: TextStyle(
                        color: ConstColors.secundayColor,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            '20/08/2021',
                            style: TextStyle(
                              color: ConstColors.secundayColor,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Text(
                          '08:00',
                          style: TextStyle(
                            color: ConstColors.secundayColor,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )),
=======
          padding: EdgeInsets.all(10),
          child: Center(
              child: Text(
            'aa',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          )),
        ),
>>>>>>> b4f219e44d6ad8584fc743718097fbf525acf431
      ),
    );
  }
}
