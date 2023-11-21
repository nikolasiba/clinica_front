import 'package:clinica/_clinica/doctor/attention_histoy/presentation/controllers/attention_history_ctr.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/custom_button.dart';
import 'package:clinica/shared/widgets/custom_page.dart';
import 'package:clinica/shared/widgets/custom_table.dart';
import 'package:clinica/shared/widgets/custom_text_field.dart';
import 'package:clinica/shared/widgets/separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AttentionHistoryPage extends StatelessWidget {
  const AttentionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => AttentionHistoryController(),
        child: _AttentionHistoryBody());
  }
}

class _AttentionHistoryBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AttentionHistoryController>(context);

    return CustomPage(
      body: controller.appoinmentsHistory.isNotEmpty
          ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.history,
                            size: 35,
                            color: ConstColors.primaryColor,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Historial de atención',
                            style: TextStyle(
                              color: ConstColors.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )),
                  const Separator(size: 4),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       left: Responsive.of(context).width * .08,
                  //       right: Responsive.of(context).width * .08),
                  //   child: _attentionSearch(),
                  // ),
                  const Separator(size: 2),
                  Align(
                    alignment: Alignment.center,
                    child: _attentionHistoryTable(context),
                  ),
                ],
              ),
              const Spacer(),
              // const Separator(size: 8),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  onPressed: () {},
                  text: 'Cerrar',
                  width: Responsive.of(context).width * .3,
                  backgroundColor: ConstColors.primaryColor,
                ),
              ),
            ])
          : const Center(
              child: Text(
              'No hay datos para mostrar',
              style: TextStyle(fontSize: 18),
            )),
    );
  }
}

Widget _attentionHistoryTable(BuildContext context) {
  final controller = Provider.of<AttentionHistoryController>(context);

  return SingleChildScrollView(
      child: DataTable(
          border: TableBorder.all(
              borderRadius: BorderRadius.circular(10),
              color: ConstColors.secundayColor,
              style: BorderStyle.solid,
              width: 1),
          columns: const [
            DataColumn(label: Text('Fecha-Hora')),
            DataColumn(label: Text('Estado')),
            DataColumn(label: Text('Paciente')),
            DataColumn(label: Text('Cedula')),
          ],
          rows: controller.appoinmentsHistory
              .map((e) => DataRow(cells: [
                    DataCell(Text(e.hour.toString())),
                    DataCell(Text(e.appointmentState!)),
                    DataCell(Text(e.patientName.toString())),
                    DataCell(Text(e.patientId.toString()))
                  ]))
              .toList()));
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
