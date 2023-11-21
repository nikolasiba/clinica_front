import 'package:clinica/_clinica/patient/appoinment/presentation/controller/appoinment_ctrl.dart';
import 'package:clinica/_clinica/patient/petitions/presentation/controller/petition_ctrl.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/custom_button.dart';
import 'package:clinica/shared/widgets/custom_page.dart';
import 'package:clinica/shared/widgets/separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePetitionPage extends StatefulWidget {
  const CreatePetitionPage({super.key});

  @override
  State<CreatePetitionPage> createState() => _CreatePetitionPageState();
}

class _CreatePetitionPageState extends State<CreatePetitionPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PetitionController>(context);
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
                  'Crear Petición',
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
                      label: Expanded(
                          child: Center(child: Text('Crear \nPetición')))),
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
                rows: controller.finishedAppointments
                    .map((element) => DataRow(cells: [
                          DataCell(Center(
                              child: IconButton(
                                  onPressed: () async {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return _alertContent();
                                        });
                                  },
                                  icon: const Icon(Icons.add_circle_outline)))),
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
        title: Text(
          'Historial de cita',
          style: TextStyle(
              color: ConstColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        content: Container(
          padding: const EdgeInsets.all(10),
          height: 200,
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detalles de la cita',
                style: TextStyle(
                    color: ConstColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const Separator(size: 3),
              RichText(
                  text: TextSpan(
                      text: 'Diagnostico: ',
                      style: TextStyle(
                          color: ConstColors.primaryColor,
                          fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                      text: controller.attentionDetailModel.diagnosis,
                      style: TextStyle(
                          color: ConstColors.secundayColor,
                          fontWeight: FontWeight.normal),
                    )
                  ])),
              const Separator(size: 3),
              RichText(
                  text: TextSpan(
                      text: 'Notas medicas: ',
                      style: TextStyle(
                          color: ConstColors.primaryColor,
                          fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                      text: controller.attentionDetailModel.medicalNotes,
                      style: TextStyle(
                          color: ConstColors.secundayColor,
                          fontWeight: FontWeight.normal),
                    )
                  ])),
              const Separator(size: 3),
              RichText(
                  text: TextSpan(
                      text: 'Diagnostico: ',
                      style: TextStyle(
                          color: ConstColors.primaryColor,
                          fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                      text: controller.attentionDetailModel.diagnosis,
                      style: TextStyle(
                          color: ConstColors.secundayColor,
                          fontWeight: FontWeight.normal),
                    )
                  ])),
              const Separator(size: 3),
              RichText(
                  text: TextSpan(
                      text: 'Tratamiento: ',
                      style: TextStyle(
                          color: ConstColors.primaryColor,
                          fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                      text: controller.attentionDetailModel.treatment,
                      style: TextStyle(
                          color: ConstColors.secundayColor,
                          fontWeight: FontWeight.normal),
                    )
                  ])),
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
