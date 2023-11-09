import 'package:flutter/material.dart';
import 'package:kashbook_app/widgets/custom_radio_button.dart';

enum ListItem { day, month, year }

class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({super.key});

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  ListItem item = ListItem.day;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            title: const Text('day'),
            leading: RadioButton<ListItem>(
              value: ListItem.day,
              groupValue: item,
              onChanged: (ListItem? value) {
                setState(() {
                  item = value!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('month'),
            leading: RadioButton<ListItem>(
              value: ListItem.month,
              groupValue: item,
              onChanged: (ListItem? value) {
                setState(() {
                  item = value!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Year'),
            leading: RadioButton<ListItem>(
              value: ListItem.year,
              groupValue: item,
              onChanged: (ListItem? value) {
                setState(() {
                  item = value!;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
