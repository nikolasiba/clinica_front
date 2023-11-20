import 'package:clinica/_clinica/patient/appoinment/presentation/controller/appoinment_ctrl.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/custom_drop_down.dart';
import 'package:clinica/shared/widgets/custom_page.dart';
import 'package:clinica/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientAppoinmentPage extends StatefulWidget {
  const PatientAppoinmentPage({super.key});

  @override
  State<PatientAppoinmentPage> createState() => _PatientAppoinmentPageState();
}

class _PatientAppoinmentPageState extends State<PatientAppoinmentPage> {
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final appoinmentController = Provider.of<AppoinmentController>(context);
      appoinmentController.getSpecialization();
      appoinmentController.getAppoinments();
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    final controller = Provider.of<AppoinmentController>(context);

    return CustomPage(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 1,
                  child: CustomDropDownButtom(
                    list: controller.listSpecialization,
                    selectedValue: controller.selectValue,
                    onChanged: (dynamic value) {
                      controller.changeSpecialization(value);
                    },
                  )),
              Flexible(
                flex: 1,
                child: CustomButton(
                    onPressed: () {
                      controller.validateSpecilization(context);
                    },
                    text: 'Consultar Disponibilidad',
                    backgroundColor: ConstColors.primaryColor,
                    width: responsive.wp(25)),
              ),
            ],
          ),
          const Separator(size: 2),
          Container(
            padding: const EdgeInsets.only(left: 40, top: 20),
            width: double.infinity,
            height: responsive.hp(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ConstColors.primaryColor),
            child: const Text(
              'Mis Citas',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const Separator(size: 2),
          controller.myAppoinments.isEmpty
              ? const Center(child: Text('No hay tienes citas pendientes'))
              : SizedBox(
                  height: responsive.hp(45),
                  width: double.infinity,
                  child: RawScrollbar(
                    thumbVisibility: true,
                    thumbColor: ConstColors.primaryColor,
                    child: SingleChildScrollView(
                      child: DataTable(
                          border: TableBorder.all(
                              borderRadius: BorderRadius.circular(10),
                              color: ConstColors.secundayColor,
                              style: BorderStyle.solid,
                              width: 1),
                          columns: const [
                            DataColumn(label: Text('Fecha - Hora')),
                            DataColumn(label: Text('EPS')),
                            DataColumn(label: Text('Servicio')),
                            DataColumn(label: Text('Profesional')),
                            DataColumn(label: Text('Cancelar')),
                          ],
                          rows: controller.myAppoinments
                              .map((e) => DataRow(cells: [
                                    DataCell(Text(e.day.toString())),
                                    DataCell(Text(e.eps!)),
                                    DataCell(Text(e.specialization!)),
                                    DataCell(Text(e.doctorName!)),
                                    DataCell(IconButton(
                                        onPressed: () async {
                                          await controller.cancelAppoinment(
                                              e.appoinmentCode!);
                                        },
                                        icon: const Icon(Icons.cancel)))
                                  ]))
                              .toList()),
                    ),
                  )),
          const Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomButton(
                width: responsive.wp(35),
                height: responsive.hp(5),
                onPressed: () async {
                  await controller.getHistoryAppoinments();
                },
                text: 'Mi historial',
                backgroundColor: ConstColors.primaryColor),
          )
        ],
      ),
    );
  }
}
