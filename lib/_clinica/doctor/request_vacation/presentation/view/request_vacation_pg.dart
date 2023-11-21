import 'package:clinica/_clinica/doctor/request_vacation/presentation/controllers/request_vacations_ctr.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/custom_button.dart';
import 'package:clinica/shared/widgets/custom_calendar.dart';
import 'package:clinica/shared/widgets/custom_page.dart';
import 'package:clinica/shared/widgets/separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../shared/util/utils.dart';
import '../../../start_day/presentation/view/start_day_pg.dart';

class RequestVacationsPage extends StatefulWidget {
  const RequestVacationsPage({super.key});

  @override
  State<RequestVacationsPage> createState() => _RequestVacationsPageState();
}

class _RequestVacationsPageState extends State<RequestVacationsPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => RequestVacationsController(),
        child: _RequestVacationsBody());
  }
}

class _RequestVacationsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RequestVacationsController>(context);
    return CustomPage(
        body: SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Responsive.of(context).height * 0.6,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Solicitar Dia libre',
                  style: TextStyle(
                    color: ConstColors.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Separator(size: 6),
              // const Align(
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     'Favor seleccione la fecha que desea su disponibilidad',
              //     style: TextStyle(
              //       color: Colors.black54,
              //       fontSize: 20,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // const Separator(size: 7),
              // Center(
              //   child: CustomCalendarWidget(
              //     initialStartDate: controller.initialDate,
              //     initialEndDate: controller.finalDate,
              //   ),
              // ),
              Text(
                'Fecha seleccionada:',
                style: TextStyle(fontSize: 18),
              ),
              ValueListenableBuilder(
                valueListenable: controller.selectedDate,
                builder: (context, value, child) {
                  return Text(
                    '${value.toLocal()}'.split(' ')[0],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  );
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  DateTime pickedDate = await DatePickerService.selectDate(
                      context, controller.selectedDate.value);
                  if (pickedDate != null) {
                    controller.selectedDate.value = pickedDate;
                  }
                },
                child: const Text('Seleccionar Fecha'),
              ),
            ],
          ),
        ),
        const Separator(size: 8),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomButton(
            onPressed: () {
              controller.requestVacations();
            },
            text: 'Solicitar',
            width: Responsive.of(context).width * .5,
            backgroundColor: ConstColors.primaryColor,
          ),
        ),
      ],
    )));
  }
}
