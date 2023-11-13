import 'package:clinica/shared/widgets/custom_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartDayPage extends StatelessWidget {
  const StartDayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPage(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Start Day Page')]),
    );
  }
}
