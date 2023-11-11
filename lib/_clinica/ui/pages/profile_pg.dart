import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppMenu(),
        backgroundColor: ConstColors.primaryColor,
        leading: Container(),
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Container(
          height: Responsive.of(context).height,
          width: Responsive.of(context).width * .85,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
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
              const Separator(size: 4),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tus datos de Contacto',
                    style: TextStyle(
                      color: ConstColors.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Alergias: '),
                      Text('Nicolas Ibañez '),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Eps: '),
                      Text('Nicolas Ibañez '),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Tipo de sangre: '),
                      Text('Nicolas Ibañez '),
                    ],
                  ),
                ],
              ),
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
              Container(
                  color: ConstColors.primaryColor,
                  width: Responsive.of(context).width,
                  height: Responsive.of(context).height * .02),
            ],
          ),
        ),
      ),
    );
  }

  Widget _personalData() {
    const double space = 2;

    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
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
      ],
    );
  }
}
