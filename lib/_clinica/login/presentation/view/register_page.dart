import 'package:clinica/_clinica/login/presentation/controller/login_ctr.dart';
import 'package:clinica/shared/assets/assets.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/custom_button.dart';
import 'package:clinica/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final loginController = Provider.of<LoginController>(context);
    final responsive = Responsive(context);

    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          width: responsive.width,
          height: responsive.height,
          child: Image.asset(
            Res.images.login,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          left: responsive.width * .04,
          top: responsive.height * .2,
          child: Container(
            padding: const EdgeInsets.all(20),
            height: responsive.height * .75,
            width: responsive.width * .55,
            decoration: BoxDecoration(
              color: ConstColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: RawScrollbar(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Registrate',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              CustomTextField(
                                labelText: 'Nombre',
                                textColor: Colors.white,
                                textEditingController:
                                    loginController.nameController,
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                labelText: 'Cedula',
                                textColor: Colors.white,
                                textEditingController:
                                    loginController.idController,
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                labelText: 'telefono',
                                textColor: Colors.white,
                                textEditingController:
                                    loginController.phoneController,
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                labelText: 'ciudad',
                                textColor: Colors.white,
                                textEditingController:
                                    loginController.cityController,
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          child: Column(
                            children: [
                              CustomTextField(
                                labelText: 'Fecha de nacimiento',
                                textColor: Colors.white,
                                textEditingController:
                                    loginController.birthdayController,
                                onTap: () {
                                  _showDatePicker(context,
                                      loginController.birthdayController);
                                },
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                maxLines: 3,
                                height: responsive.height * 0.08,
                                labelText: 'Alergias',
                                textColor: Colors.white,
                                textEditingController:
                                    loginController.allergiesController,
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                labelText: 'EPS',
                                textColor: Colors.white,
                                textEditingController:
                                    loginController.epsController,
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                labelText: 'Tipo de sangre',
                                textColor: Colors.white,
                                textEditingController:
                                    loginController.bloodTypeController,
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.white, width: 8),
                              ),
                              child: Icon(Icons.add_a_photo_outlined,
                                  color: Colors.white, size: responsive.dp(8)),
                            ),
                          ),
                        ),
                        Flexible(
                            child: Column(
                          children: [
                            CustomTextField(
                              labelText: 'Email',
                              textColor: Colors.white,
                              textEditingController:
                                  loginController.emailRegisterController,
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              labelText: 'Contrasena',
                              textColor: Colors.white,
                              textEditingController:
                                  loginController.passwordRegisterController,
                            ),
                            const SizedBox(height: 20),
                          ],
                        ))
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      onPressed: () {
                        loginController.singIn(context);
                      },
                      text: 'Registrarse',
                      backgroundColor: Colors.white,
                      width: responsive.width * 0.2,
                      colorContent: ConstColors.primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  void _showDatePicker(BuildContext context, TextEditingController controller) {
    // Muestra el cuadro de diálogo del calendario

    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 100)),
      lastDate: DateTime(2023, 12, 31),
    ).then((date) {
      // Actualiza la fecha seleccionada
      controller.text = date.toString().substring(0, 10);
    });
  }
}
