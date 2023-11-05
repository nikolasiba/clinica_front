import 'package:clinica/shared/util/responsive.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [DropdownButton].

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class CustomDropDownButtom extends StatefulWidget {
  const CustomDropDownButtom({super.key});

  @override
  State<CustomDropDownButtom> createState() => _CustomDropDownButtomState();
}

class _CustomDropDownButtomState extends State<CustomDropDownButtom> {
  String dropdownValue = list.first;

  final border = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      borderSide: BorderSide(
        color: Colors.white,
      ));

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return SizedBox(
      height: responsive.height * 0.06,
      child: DropdownMenu<String>(
        
        inputDecorationTheme: InputDecorationTheme(
          
          border: border,
          enabledBorder: border,
          focusedBorder: border,
        ),
        initialSelection: list.first,
        textStyle: const TextStyle(color: Colors.white),
        onSelected: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        
        dropdownMenuEntries:
            list.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      ),
    );
  }
}
