import 'package:clinica/shared/widgets/custom_app_menu.dart';
import 'package:flutter/material.dart';

class PatientAppoinmentPage extends StatelessWidget {
  const PatientAppoinmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomAppMenu(),
          Spacer(),
          Text('Contador Stateful', style: TextStyle(fontSize: 20)),
          FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Contador:',
                style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
