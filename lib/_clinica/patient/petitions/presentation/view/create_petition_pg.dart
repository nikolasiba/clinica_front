import 'package:clinica/_clinica/patient/petitions/presentation/controller/petition_ctrl.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/custom_button.dart';
import 'package:clinica/shared/widgets/custom_page.dart';
import 'package:clinica/shared/widgets/custom_text_field.dart';
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
                                          return _alertContent(
                                              element.appointmentId);
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

  Widget _alertContent(appointment) {
    final resposive = Responsive(context);
    final controller = Provider.of<PetitionController>(context);

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
              Center(
                  child: Text(
                'Escriba el motivo de su peticion',
                style: TextStyle(
                    color: ConstColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
              const Separator(size: 4),
              CustomTextField(
                height: resposive.hp(15),
                textColor: Colors.grey,
                borderColor: Colors.grey,
                maxLines: 5,
                textEditingController: controller.descriptionController,
                hintText: 'Motivo de la peticion',
              ),
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                onPressed: () async {
                  await controller.createPetition(appointment);
                },
                text: 'Crear',
                backgroundColor: ConstColors.primaryColor,
                width: resposive.width * .2,
              ),
              CustomButton(
                width: resposive.width * .2,
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'Cancelar',
                backgroundColor: Colors.red,
              ),
            ],
          ),
        ]);
  }
}
