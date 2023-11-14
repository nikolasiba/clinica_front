import 'package:clinica/_clinica/doctor/start_day/presentation/controller/start_day_ctr.dart';
import 'package:clinica/shared/widgets/custom_alert.dart';
import 'package:clinica/shared/widgets/custom_page.dart';
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
  const _StartDayBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPage(
      body: CustomDialog(
        //Advertencia
        title: Text('No se que titulo ponerle a este dialogo',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        content: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
              child: Text(
            'aa',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          )),
        ),
      ),
    );
  }
}
