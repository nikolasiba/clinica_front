import 'package:clinica/_clinica/patient/appoinment/presentation/controller/appoinment_ctrl.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/custom_page.dart';
import 'package:clinica/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientAppoinmentPage extends StatelessWidget {
  const PatientAppoinmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => AppoinmentController(),
        child: const _PatientAppoinmentBody());
  }
}

class _PatientAppoinmentBody extends StatefulWidget {
  const _PatientAppoinmentBody();

  @override
  State<_PatientAppoinmentBody> createState() => _PatientAppoinmentBodyState();
}

class _PatientAppoinmentBodyState extends State<_PatientAppoinmentBody> {
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final appoinmentController = Provider.of<AppoinmentController>(context);
      appoinmentController;
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    // final _controller = Provider.of<AppoinmentController>(context);

    return CustomPage(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 1,
                  child: CustomTextField(
                      labelText: 'Especialidad',
                      borderColor: ConstColors.secundayColor,
                      textEditingController: TextEditingController())),
              Flexible(
                flex: 1,
                child: CustomButton(
                    onPressed: () {},
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
            height: responsive.hp(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ConstColors.primaryColor),
            child: const Text(
              'Mis Citas',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const Separator(size: 2),
          DataTable(
              border: TableBorder.all(
                  borderRadius: BorderRadius.circular(10),
                  color: ConstColors.secundayColor,
                  style: BorderStyle.solid,
                  width: 1),
              columns: const [
                DataColumn(label: Text('Fecha -hora')),
                DataColumn(label: Text('EPS')),
                DataColumn(label: Text('Servicio')),
                DataColumn(label: Text('Profecional')),
                DataColumn(label: Text('Cancelar')),
              ],
              rows: const []),
          const Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomButton(
                width: responsive.wp(35),
                height: responsive.hp(5),
                onPressed: () {},
                text: 'Mi historial',
                backgroundColor: ConstColors.primaryColor),
          )
        ],
      ),
    );
  }
}
