import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeDatePicker extends StatefulWidget {
  const TimeDatePicker({super.key});

  @override
  State<TimeDatePicker> createState() => _TimeDatePickerState();
}

class _TimeDatePickerState extends State<TimeDatePicker> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context, firstDate: DateTime(2000), lastDate: DateTime(2050));

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: selectedTime);

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => selectDate(context),
          child: Row(
            children: [
              const Icon(Icons.calendar_today_sharp),
              Text(' ${DateFormat('yyyy-MM-dd').format(selectedDate)}',
                  style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
        InkWell(
          onTap: () => selectTime(context),
          child: Row(
            children: [
              const Icon(Icons.punch_clock),
              Text(selectedTime.format(context),
                  style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ],
    );
  }
}
