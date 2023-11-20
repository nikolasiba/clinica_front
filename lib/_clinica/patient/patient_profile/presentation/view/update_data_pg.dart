import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/custom_drop_down.dart';
import 'package:clinica/shared/widgets/custom_page.dart';
import 'package:clinica/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:clinica/_clinica/patient/patient_profile/presentation/controller/profile_ctr.dart';

import 'package:provider/provider.dart';

class UpdateDataPage extends StatefulWidget {
  const UpdateDataPage({super.key});

  @override
  State<UpdateDataPage> createState() => _UpdateDataPageState();
}

class _UpdateDataPageState extends State<UpdateDataPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PatientProfileController>(context);

    return CustomPage(
        body: RawScrollbar(
      thumbVisibility: true,
      thumbColor: ConstColors.primaryColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Actualizar datos',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ConstColors.primaryColor),
                ),
              ),
              const Separator(size: 6),
              CustomTextField(
                textEditingController: controller.alergiesController,
                borderColor: Colors.black,
                textColor: Colors.black,
                labelText: 'Alergias',
              ),
              const Separator(size: 4),

              CustomTextField(
                textEditingController: controller.phoneController,
                borderColor: Colors.black,
                textColor: Colors.black,
                labelText: 'Telefono',
              ),
              const Separator(size: 4),

              CustomTextField(
                textEditingController: controller.emailController,
                borderColor: Colors.black,
                textColor: Colors.black,
                labelText: 'Correo',
              ),
              const Separator(size: 4),

              //eps
              CustomDropDownButtom(
                  list: controller.eps,
                  selectedValue: controller.selectedEps,
                  onChanged: (value) {
                    controller.customOnchanges(value!, 1);
                  }),
              const Separator(size: 4),

              //tipo de sangre
              CustomDropDownButtom(
                  list: controller.bloodTypes,
                  selectedValue: controller.selectedBloodType,
                  onChanged: (value) {
                    controller.customOnchanges(value!, 2);
                  }),
              const Separator(size: 4),

              //ciudad
              CustomDropDownButtom(
                  list: controller.cities,
                  selectedValue: controller.selectedCity,
                  onChanged: (value) {
                    controller.customOnchanges(value!, 3);
                  }),
              const Separator(size: 6),
              CustomButton(
                onPressed: () async {
                  await controller.updateData();
                },
                text: 'Actualizar',
                backgroundColor: ConstColors.primaryColor,
                width: Responsive.of(context).width * .5,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
