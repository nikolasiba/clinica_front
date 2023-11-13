import 'package:clinica/_clinica/patient/patient_profile/presentation/controller/profile_ctr.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientProfilePage extends StatelessWidget {
  const PatientProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => PatientProfileController(), child: _ProfileBody());
  }
}

class _ProfileBody extends StatelessWidget {
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
                        _personalData(),
                        const Separator(size: 14),
                        _contacData(),
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

Widget _contacData() {
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
          text: const TextSpan(text: 'Teléfono: ', children: [
        TextSpan(
          text: '1231231231',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        )
      ])),
      RichText(
          text: const TextSpan(text: 'Dirección: ', children: [
        TextSpan(
          text: 'Calle 12 # 12-12',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        )
      ])),
      RichText(
          text: const TextSpan(text: 'Email: ', children: [
        TextSpan(
          text: 'nikolasiba23@gmail.com',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        )
      ])),
    ],
  );
}

Widget _personalData() {
  const double space = 2;

  return const Row(
    children: [
      Spacer(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Nombre: '),
              Text('Nicolas Ibañez '),
            ],
          ),
          Separator(size: space),
          Row(
            children: [
              Text('Cedula: '),
              Text('Nicolas Ibañez '),
            ],
          ),
          Separator(size: space),
          Row(
            children: [
              Text('Fecha de nacimiento: '),
              Text('Nicolas Ibañez '),
            ],
          ),
        ],
      ),
      Separator(size: 5, vertical: false),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Alergias: '),
              Text('Nicolas Ibañez '),
            ],
          ),
          Separator(size: space),
          Row(
            children: [
              Text('Eps: '),
              Text('Nicolas Ibañez '),
            ],
          ),
          Separator(size: space),
          Row(
            children: [
              Text('Tipo de sangre: '),
              Text('Nicolas Ibañez '),
            ],
          ),
        ],
      ),
      Spacer()
    ],
  );
}
