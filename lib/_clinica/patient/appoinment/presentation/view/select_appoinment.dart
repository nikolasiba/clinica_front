import 'package:clinica/_clinica/patient/appoinment/presentation/controller/appoinment_ctrl.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/custom_page.dart';
import 'package:clinica/shared/widgets/separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectAppoinmentPage extends StatefulWidget {
  const SelectAppoinmentPage({super.key});

  @override
  State<SelectAppoinmentPage> createState() => _SelectAppoinmentPageState();
}

class _SelectAppoinmentPageState extends State<SelectAppoinmentPage> {
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
                  'Citas diponibles para ti',
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
                    child: Center(child: Text('Fecha')),
                  )),
                  DataColumn(
                      label: Expanded(child: Center(child: Text('Hora')))),
                  DataColumn(
                      label: Expanded(child: Center(child: Text('Doctor')))),
                  DataColumn(
                      label: Expanded(child: Center(child: Text('Solicitar')))),
                ],
                rows: controller.availableAppoinments
                    .map((element) => DataRow(cells: [
                          DataCell(Center(
                              child: Text(
                                  element.day.toString().substring(0, 10)))),
                          DataCell(Center(
                              child: Text(
                                  '${element.initialTime!.substring(0, 5)} - ${element.finalTime!.substring(0, 5)}'))),
                          DataCell(Center(child: Text(element.doctorName!))),
                          DataCell(Center(
                              child: IconButton(
                                  onPressed: () async {
                                    await controller.requestAppoinment(element);
                                  },
                                  icon: const Icon(Icons.add_circle))))
                        ]))
                    .toList()),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
