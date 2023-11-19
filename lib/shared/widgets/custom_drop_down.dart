import 'package:clinica/shared/util/responsive.dart';
import 'package:flutter/material.dart';

class CustomDropDownButtom extends StatefulWidget {
  const CustomDropDownButtom(
      {super.key,
      required this.list,
      required this.selectedValue,
      required this.onChanged});

  final List list;
  final void Function(String?) onChanged;

  final String selectedValue;
  @override
  State<CustomDropDownButtom> createState() => _CustomDropDownButtomState();
}

class _CustomDropDownButtomState extends State<CustomDropDownButtom> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Container(
      padding:
          const EdgeInsets.only(top: 20, left: 18.0, right: 18, bottom: 10.0),
      width: responsive.width * .9,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(width: 2, color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: DropdownButton(
            //decoration: const InputDecoration(border: InputBorder.none),
            value: widget.selectedValue,
            onChanged: widget.onChanged,
            isExpanded: true,
            items: widget.list.map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
