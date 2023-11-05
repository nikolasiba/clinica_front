import 'package:clinica/shared/util/responsive.dart';
import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  const Separator({super.key, this.vertical = true, required this.size});

  final bool vertical;
  final double size;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return SizedBox(
      width: vertical ? 0 : responsive.width * (size / 100),
      height: vertical ? responsive.height * (size / 100) : 0,
    );
  }
}
