import 'package:clinica/_clinica/doctor/appointment_detail/presentation/controllers/appointment_detail_ctr.dart';
import 'package:clinica/shared/widgets/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentDetailPage extends StatelessWidget {
  const AppointmentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ApointmentDetailController(),
        child: _AppointmentDetailBody());
  }
}

class _AppointmentDetailBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPage(
      body: const Column(),
    );
  }
}
