import 'package:clinica/shared/util/responsive.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.borderColor,
    required this.textEditingController,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.maxLines,
    this.height,
    this.prefixIcon,
    this.textColor,
    this.onTap,
  });

  final TextEditingController textEditingController;
  final Function(String)? onChanged;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final double? height;
  final Icon? prefixIcon;
  final Color? borderColor;
  final Color? textColor;
  final void Function()? onTap;

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final border = OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(
          color: widget.borderColor ?? Colors.white,
        ));

    return Column(
      children: [
        SizedBox(
          height: widget.height ?? responsive.height * 0.06,
          child: TextField(
            maxLines: widget.maxLines ?? 1,
            keyboardType: widget.keyboardType,
            controller: widget.textEditingController,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            style: TextStyle(
                color: widget.textColor ?? Colors.black, fontSize: 18),
            decoration: InputDecoration(
                prefixIcon: widget.prefixIcon,
                fillColor: Colors.white,
                hintText: widget.hintText,
                hintStyle:
                    TextStyle(color: widget.textColor ?? Colors.grey[600]),
                labelText: widget.labelText,
                labelStyle:
                    TextStyle(color: widget.textColor ?? Colors.grey[600]),
                focusedBorder: border,
                enabledBorder: border,
                border: border),
          ),
        ),
      ],
    );
  }
}
