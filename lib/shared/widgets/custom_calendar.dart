import 'package:clinica/shared/util/responsive.dart';
import 'package:flutter/material.dart';

class CustomCalendarWidget extends StatefulWidget {
  final DateTime initialStartDate;
  final DateTime initialEndDate;

  const CustomCalendarWidget({
    super.key,
    required this.initialStartDate,
    required this.initialEndDate,
  });

  @override
  _CustomCalendarWidgetState createState() => _CustomCalendarWidgetState();
}

class _CustomCalendarWidgetState extends State<CustomCalendarWidget> {
  late DateTimeRange _selectedDateRange;

  @override
  void initState() {
    super.initState();
    _selectedDateRange = DateTimeRange(
      start: widget.initialStartDate,
      end: widget.initialEndDate,
    );
  }

  Future<void> _selectDateRange(BuildContext context, bool isStart) async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      initialDateRange: _selectedDateRange,
      firstDate: DateTime(2023, 1, 1),
      lastDate: DateTime(2023, 12, 31),
    );

    if (picked != null) {
      setState(() {
        _selectedDateRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: Responsive.of(context).width * 0.3,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: InkWell(
              onTap: () => _selectDateRange(context, true),
              child: Center(
                child: Text(
                  _selectedDateRange.start.toString().substring(0, 10),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 2,
            height: 30, // Adjust the height to match your design
            child: Container(
              color: Colors.black,
            ),
          ),
          Container(
            width: Responsive.of(context).width * 0.3,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: InkWell(
              onTap: () => _selectDateRange(context, false),
              child: Center(
                child: Text(
                  _selectedDateRange.end.toString().substring(0, 10),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
