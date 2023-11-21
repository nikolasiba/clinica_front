import 'package:clinica/_clinica/doctor/appointment_detail/presentation/controllers/appointment_detail_ctr.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/custom_button.dart';
import 'package:clinica/shared/widgets/custom_page.dart';
import 'package:clinica/shared/widgets/custom_text_field.dart';
import 'package:clinica/shared/widgets/separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentDetailPage extends StatelessWidget {
  const AppointmentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ApointmentDetailController(),
        child: _AppointmentDetailBody());
  }
}

class _AppointmentDetailBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ApointmentDetailController>(context);
    return CustomPage(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Detalles de la cita',
              style: TextStyle(
                color: ConstColors.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Separator(size: 5),
          _informationAppointmentWg(),
          const Separator(size: 5),
          Container(
            color: Colors.black54,
            height: 1.5,
            width: Responsive.of(context).width * .7,
          ),
          const Separator(size: 5),
          _reasonAppointmentWg(context),
          const Separator(size: 8),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButton(
              onPressed: () {},
              text: 'Cerrar',
              width: Responsive.of(context).width * .3,
              backgroundColor: ConstColors.primaryColor,
            ),
          ),
        ],
      )),
    );
  }

  Widget _informationAppointmentWg() {
    return const Column(
      children: [
        Row(
          children: [
            Text(
              'Paciente: ',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Humbero gomez',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Separator(size: 1.5),
        Row(
          children: [
            Text(
              'Tipo de sangre: ',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'B+',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Separator(size: 1.5),
        Row(
          children: [
            Text(
              'Alergias: ',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Gatos',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Separator(size: 1.5),
        Row(
          children: [
            Text(
              'Edad: ',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '25',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Separator(size: 1.5),
        Row(
          children: [
            Text(
              'Eps: ',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Sanitas',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _reasonAppointmentWg(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Motivo de la consulta: ',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Separator(size: 3),
        Padding(
          padding: EdgeInsets.only(
              left: Responsive.of(context).height * .15,
              right: Responsive.of(context).height * .15),
          child: CustomTextField(
            textEditingController: TextEditingController()..text = '',
            height: Responsive.of(context).height * .2,
            borderColor: Colors.black,
            maxLines: 4,
          ),
        )
      ],
    );
  }
}
