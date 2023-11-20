import 'package:clinica/_clinica/patient/appoinment/presentation/controller/appoinment_ctrl.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/custom_button.dart';
import 'package:clinica/shared/widgets/custom_page.dart';
import 'package:clinica/shared/widgets/separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryAppointmentPage extends StatefulWidget {
  const HistoryAppointmentPage({super.key});

  @override
  State<HistoryAppointmentPage> createState() => _HistoryAppointmentPageState();
}

class _HistoryAppointmentPageState extends State<HistoryAppointmentPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AppoinmentController>(context);
    final responsive = Responsive(context);
    return CustomPage(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 40, top: 20),
            width: double.infinity,
            height: responsive.hp(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ConstColors.primaryColor),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: responsive.dp(2),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Historial de citas',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          const Separator(size: 2),
          SizedBox(
            width: double.infinity,
            child: DataTable(
                border: TableBorder.all(
                    borderRadius: BorderRadius.circular(10),
                    color: ConstColors.secundayColor,
                    style: BorderStyle.solid,
                    width: 1),
                columns: const [
                  DataColumn(
                      label: Expanded(child: Center(child: Text('Detalles')))),
                  DataColumn(
                      label: Expanded(child: Center(child: Text('Fecha')))),
                  DataColumn(
                      label:
                          Expanded(child: Center(child: Text('Especialidad')))),
                  DataColumn(
                      label: Expanded(child: Center(child: Text('Doctor')))),
                  DataColumn(
                      label: Expanded(child: Center(child: Text('Estado')))),
                ],
                rows: controller.historyAppoinments
                    .map((element) => DataRow(cells: [
                          DataCell(Center(
                              child: element.appointmentState! != 'CANCELLED'
                                  ? IconButton(
                                      onPressed: () async {
                                        await controller.getAttentionDetail(
                                            element.appointmentId!);
                                        Future.delayed(
                                            const Duration(seconds: 1),
                                            () => showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return _alertContent();
                                                }));
                                      },
                                      icon: const Icon(Icons.remove_red_eye))
                                  : const Text(
                                      'Cancelada',
                                      style: TextStyle(color: Colors.red),
                                    ))),
                          DataCell(Center(
                              child: Text(
                                  element.day.toString().substring(0, 10)))),
                          DataCell(
                              Center(child: Text(element.specialization!))),
                          DataCell(Center(child: Text(element.doctorName!))),
                          DataCell(
                              Center(child: Text(element.appointmentState!))),
                        ]))
                    .toList()),
          ),
          const Spacer(),
          Center(
            child: CustomButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'Regresar',
                width: responsive.wp(35),
                backgroundColor: ConstColors.primaryColor),
          )
        ],
      ),
    );
  }

  Widget _alertContent() {
    final controller = Provider.of<AppoinmentController>(context);

    return AlertDialog(
        title: const Text('Hsitorial de cita'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        content: Container(
          padding: const EdgeInsets.all(10),
          height: 300,
          width: 600,
          child: Column(
            children: [
              const Text('Detalles de la cita'),
              Text(controller.attentionDetailModel.codeAppointment.toString()),
              Text(controller.attentionDetailModel.diagnosis!),
            ],
          ),
        ),
        actions: [
          CustomButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: 'Regresar',
            backgroundColor: ConstColors.primaryColor,
          ),
        ]);
  }
}
