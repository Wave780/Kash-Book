import 'package:flutter/material.dart';

enum ListItem { day, month, year }

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  ListItem _item = ListItem.day;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('day'),
          leading: Radio<ListItem>(
            value: ListItem.day,
            groupValue: _item,
            onChanged: (ListItem? value) {
              setState(() {
                _item = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('month'),
          leading: Radio<ListItem>(
            value: ListItem.month,
            groupValue: _item,
            onChanged: (ListItem? value) {
              setState(() {
                _item = value!;
              });
            },
          ),
        )
      ],
    );
  }
}
