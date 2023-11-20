import 'package:clinica/_clinica/patient/patient_profile/presentation/controller/profile_ctr.dart';
import 'package:clinica/_clinica/services/navigation_service.dart';
import 'package:clinica/locator.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientProfilePage extends StatefulWidget {
  const PatientProfilePage({super.key});

  @override
  State<PatientProfilePage> createState() => _PatientProfilePageState();
}

class _PatientProfilePageState extends State<PatientProfilePage> {
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final profileViewModel = Provider.of<PatientProfileController>(context);
      profileViewModel.getPatientProfile();
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PatientProfileController>(context);
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
                        _personalData(context),
                        const Separator(size: 14),
                        _contacData(context),
                        const Spacer(),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomButton(
                            onPressed: () async {
                              await controller.getData();
                              locator<NavigationService>()
                                  .navigateTo('/update_data');
                            },
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

Widget _contacData(context) {
  final controller = Provider.of<PatientProfileController>(context);

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Tus datos de Contacto',
        style: TextStyle(
          color: ConstColors.primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      RichText(
          text: TextSpan(text: 'Teléfono: ', children: [
        TextSpan(
          text: controller.patientModel.phone ?? 'No registrado',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        )
      ])),
      RichText(
          text: TextSpan(text: 'Ciudad: ', children: [
        TextSpan(
          text: controller.patientModel.city ?? 'No registrado',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        )
      ])),
      RichText(
          text: TextSpan(text: 'Email: ', children: [
        TextSpan(
          text: controller.patientModel.email ?? 'No registrado',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        )
      ])),
    ],
  );
}

Widget _personalData(context) {
  final controller = Provider.of<PatientProfileController>(context);
  const double space = 2;

  return Row(
    children: [
      const Spacer(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Nombre: '),
              Text(controller.patientModel.name ?? 'No registrado'),
            ],
          ),
          const Separator(size: space),
          Row(
            children: [
              const Text('Cedula: '),
              Text(
                  '${controller.patientModel.identification ?? 'No registrado'} '),
            ],
          ),
          const Separator(size: space),
          Row(
            children: [
              const Text('Fecha de nacimiento: '),
              Text(controller.patientModel.birthday ?? 'No registrado'),
            ],
          ),
        ],
      ),
      const Separator(size: 5, vertical: false),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Alergias: '),
              Text(controller.patientModel.allergies ?? 'No registrado'),
            ],
          ),
          const Separator(size: space),
          Row(
            children: [
              const Text('Eps: '),
              Text(controller.patientModel.eps ?? 'No registrado'),
            ],
          ),
          const Separator(size: space),
          Row(
            children: [
              const Text('Tipo de sangre: '),
              Text(controller.patientModel.bloodType ?? 'No registrado'),
            ],
          ),
        ],
      ),
      const Spacer()
    ],
  );
}
