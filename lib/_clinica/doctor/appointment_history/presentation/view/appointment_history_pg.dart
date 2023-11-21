import 'package:clinica/_clinica/doctor/appointment_history/presentation/controllers/appointment_history_ctr.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/custom_button.dart';
import 'package:clinica/shared/widgets/custom_page.dart';
import 'package:clinica/shared/widgets/custom_table.dart';
import 'package:clinica/shared/widgets/custom_text_field.dart';
import 'package:clinica/shared/widgets/separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentHistoryPage extends StatelessWidget {
  const AppointmentHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => AppointmentHistoryController(),
        child: _AppointmentHistoryBody());
  }
}

class _AppointmentHistoryBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AppointmentHistoryController>(context);

    return CustomPage(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Historico de citas',
                  style: TextStyle(
                    color: ConstColors.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Separator(size: 4),
              Padding(
                padding: EdgeInsets.only(
                    left: Responsive.of(context).width * .08,
                    right: Responsive.of(context).width * .08),
                child: _attentionSearch(),
              ),
              const Separator(size: 4),
              Align(
                alignment: Alignment.center,
                child: _attentionHistoryTable(context),
              ),
            ],
          ),
          const Separator(size: 8),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButton(
              onPressed: () {},
              text: 'Salir',
              width: Responsive.of(context).width * .3,
              backgroundColor: ConstColors.primaryColor,
            ),
          ),
        ]),
      ),
    );
  }
}

Widget _attentionHistoryTable(BuildContext context) {
  return SingleChildScrollView(
      child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: TableCustomWg(
        widgthRow: Responsive.of(context).height * 0.2,
        colorPrimary: true,
        listDataColumns: const [
          'Fecha-Hora',
          'Servicios',
          'Profesional',
        ],
        listDataRow: const [
          ['9:00', 'Atendida', 'Pepito'],
          ['10:00', 'Atendida', 'Salomon'],
          ['14:00', 'Cancelada', 'Benjamin'],
          ['14:00', 'Cancelada', 'Benjamin'],
        ]),
  ));
}

Widget _attentionSearch() {
  return Row(
    children: [
      Expanded(
          child: CustomTextField(
        hintText: 'Buscar',
        borderColor: Colors.black,
        height: 45,
        textEditingController: TextEditingController(),
      )),
      const SizedBox(
        width: 10,
      ),
      const Icon(Icons.search)
    ],
  );
}
