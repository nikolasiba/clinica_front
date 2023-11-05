import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.body,
    this.color = Colors.white,
    this.borderRadius = 20,
    this.padding = const EdgeInsets.all(0),
  });
  final Widget? body;
  final Color color;
  final double borderRadius;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: padding,
        child: body,
      ),
    );
  }
}
