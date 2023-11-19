import 'package:clinica/_clinica/doctor/manage_agenda/presentation/controllers/manage_agenda_ctr.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/custom_button.dart';
import 'package:clinica/shared/widgets/custom_page.dart';
import 'package:clinica/shared/widgets/custom_table.dart';
import 'package:clinica/shared/widgets/separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageAgendaPage extends StatelessWidget {
  ManageAgendaPage({super.key});
  ManageAgendaController? startDayController;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ManageAgendaController(), child: _ManageAgendaBody());
  }
}

class _ManageAgendaBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPage(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          Align(
            alignment: Alignment.center,
            child: _appointmentsTodayTable(context),
          ),
          const Separator(size: 4),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Agenda',
                style: TextStyle(
                  color: ConstColors.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
          const Separator(size: 4),
          Align(
            alignment: Alignment.center,
            child: _agendaTable(context),
          ),
          const Separator(size: 8),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButton(
              onPressed: () {},
              text: 'Actualizar',
              width: Responsive.of(context).width * .5,
              backgroundColor: ConstColors.primaryColor,
            ),
          ),
        ]),
      ),
    );
  }
}

Widget _appointmentsTodayTable(BuildContext context) {
  return SingleChildScrollView(
      child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: TableCustomWg(
        widgthRow: Responsive.of(context).height * 0.2,
        colorPrimary: true,
        listDataColumns: const [
          'Hora',
          'Estado',
          'Paciente',
          'Cedula',
        ],
        listDataRow: const [
          ['9:00', 'Atendida', 'Pepito', '12345'],
          ['10:00', 'Atendida', 'Salomon', '45127'],
          ['14:00', 'Cancelada', 'Benjamin', '98521'],
        ]),
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
