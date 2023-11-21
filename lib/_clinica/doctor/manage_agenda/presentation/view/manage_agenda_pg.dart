import 'package:clinica/_clinica/doctor/manage_agenda/presentation/controllers/manage_agenda_ctr.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/custom_button.dart';
import 'package:clinica/shared/widgets/custom_page.dart';
import 'package:clinica/shared/widgets/custom_table.dart';
import 'package:clinica/shared/widgets/separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../locator.dart';
import '../../../../services/navigation_service.dart';

class ManageAgendaPage extends StatefulWidget {
  const ManageAgendaPage({super.key});

  @override
  State<ManageAgendaPage> createState() => _ManageAgendaState();
}

class _ManageAgendaState extends State<ManageAgendaPage> {
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final appoinmentController = Provider.of<ManageAgendaController>(context);
      // appoinmentController.getSpecialization();
      appoinmentController.getAppoinments();
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ManageAgendaController>(context);

    return CustomPage(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(
                  Icons.person_pin_rounded,
                  size: 35,
                  color: ConstColors.primaryColor,
                ),
                const SizedBox(width: 10),
                Text(
                  'Gestion Agenda',
                  style: TextStyle(
                    color: ConstColors.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )),
        const Separator(size: 4),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Citas de hoy',
              style: TextStyle(
                color: ConstColors.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )),
        const Separator(size: 4),
        controller.appoinmentsToday.isNotEmpty
            ? Align(
                alignment: Alignment.center,
                child: _appointmentsTodayTable(context),
              )
            : const Align(
                alignment: Alignment.center,
                child: Text('No hay citas para hoy'),
              ),
        //const Separator(size: 4),
        // Align(
        //     alignment: Alignment.centerLeft,
        //     child: Text(
        //       'Agenda',
        //       style: TextStyle(
        //         color: ConstColors.primaryColor,
        //         fontSize: 20,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     )),
        // const Separator(size: 4),
        // Align(
        //   alignment: Alignment.center,
        //   child: _agendaTable(context),
        // ),
        // const Separator(size: 8),
        const Spacer(),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomButton(
            onPressed: () {
              // controller.printA();
            },
            text: 'Cerrar',
            width: Responsive.of(context).width * .5,
            backgroundColor: ConstColors.primaryColor,
          ),
        ),
      ]),
    );
  }
}

Widget _appointmentsTodayTable(BuildContext context) {
  final controller = Provider.of<ManageAgendaController>(context);

  return SingleChildScrollView(
      child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: DataTable(
        border: TableBorder.all(
            borderRadius: BorderRadius.circular(10),
            color: ConstColors.secundayColor,
            style: BorderStyle.solid,
            width: 1),
        columns: const [
          DataColumn(label: Text('Hora')),
          DataColumn(label: Text('Estado')),
          DataColumn(label: Text('Paciente')),
          DataColumn(label: Text('Cedula')),
          DataColumn(label: Text('Ver detalle')),
          //  DataColumn(label: Text('Realizar Consulta')),
        ],
        rows: controller.appoinmentsToday
            .map((e) => DataRow(cells: [
                  DataCell(Text(e.hour.toString())),
                  DataCell(Text(e.appointmentState!)),
                  DataCell(Text(e.patientName.toString())),
                  DataCell(Text(e.patientId.toString())),
                  DataCell(IconButton(
                      onPressed: () async {
                        //  await controller.cancelAppoinment(e.appoinmentCode!);
                        locator<NavigationService>()
                            .navigateTo('/appointment_detail');
                      },
                      icon: const Icon(Icons.remove_red_eye))),
                  // DataCell(IconButton(
                  //     onPressed: () async {
                  //       //  await controller.cancelAppoinment(e.appoinmentCode!);
                  //       locator<NavigationService>()
                  //           .navigateTo('/appointment_detail');
                  //     },
                  //     icon: const Icon(Icons.edit_document)))
                ]))
            .toList()),
  ));
}

Widget _agendaTable(BuildContext context) {
  return SingleChildScrollView(
      child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: TableCustomWg(
        widgthRow: Responsive.of(context).height * 0.2,
        colorPrimary: true,
        listDataColumns: const [
          'Hora',
          '#Citas',
        ],
        listDataRow: const [
          ['25/10/2023', '4'],
          ['02/11/2023', '2'],
          ['10/11/2023', '3'],
        ]),
  ));
}
