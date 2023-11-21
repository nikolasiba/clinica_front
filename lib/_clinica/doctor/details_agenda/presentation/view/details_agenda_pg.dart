import 'package:clinica/_clinica/doctor/details_agenda/presentation/controllers/details_agenda_ctr.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/custom_button.dart';
import 'package:clinica/shared/widgets/custom_page.dart';
import 'package:clinica/shared/widgets/custom_table.dart';
import 'package:clinica/shared/widgets/separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsAgendaPage extends StatelessWidget {
  const DetailsAgendaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => DetailsAgendaController(), child: _DetailsAgendaPage());
  }
}

class _DetailsAgendaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DetailsAgendaController>(context);

    return CustomPage(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: Responsive.of(context).height * 0.6,
            child: Column(
              children: [
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
                          'Detalle de la agenda',
                          style: TextStyle(
                            color: ConstColors.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
                const Separator(size: 4),
                SizedBox(
                  height: Responsive.of(context).height * 0.45,
                  child: Align(
                    alignment: Alignment.center,
                    child: _detailsAgendaTable(context),
                  ),
                ),
              ],
            ),
          ),
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
        ]),
      ),
    );
  }
}

Widget _detailsAgendaTable(BuildContext context) {
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
          ['14:00', 'Cancelada', 'Benjamin', '98521'],
        ]),
  ));
}
