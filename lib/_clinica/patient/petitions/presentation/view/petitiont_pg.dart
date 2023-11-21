import 'package:clinica/_clinica/patient/petitions/presentation/controller/petition_ctrl.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/custom_button.dart';
import 'package:clinica/shared/widgets/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetitionPage extends StatefulWidget {
  const PetitionPage({super.key});

  @override
  State<PetitionPage> createState() => _PetitionPageState();
}

class _PetitionPageState extends State<PetitionPage> {
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final controller = Provider.of<PetitionController>(context);
      controller.getPetitions();
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final resposive = Responsive.of(context);
    final controller = Provider.of<PetitionController>(context);
    return CustomPage(
        body: Column(
      children: [
        const SizedBox(height: 20),
        Text('Mis peticiones',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ConstColors.secundayColor)),
        const SizedBox(height: 20),
        Container(),
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
                    label:
                        Expanded(child: Center(child: Text('Tipo Peticion')))),
                DataColumn(
                    label: Expanded(child: Center(child: Text('Razon')))),
                DataColumn(
                    label:
                        Expanded(child: Center(child: Text('Especialidad')))),
                DataColumn(
                    label:
                        Expanded(child: Center(child: Text('Estado Peticion'))))
              ],
              rows: controller.petitions
                  .map((element) => DataRow(cells: [
                        DataCell(Center(child: Text(element.typePetition!))),
                        DataCell(Center(child: Text(element.reason!))),
                        DataCell(Center(child: Text(element.specialty!))),
                        DataCell(Center(child: Text(element.petitionState!))),
                      ]))
                  .toList()),
        ),
        const Spacer(),
        CustomButton(
          onPressed: () {},
          text: 'Crear Peticion',
          backgroundColor: ConstColors.primaryColor,
          width: resposive.wp(25),
        )
      ],
    ));
  }
}
