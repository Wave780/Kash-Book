import 'package:flutter/material.dart';

import 'package:kashbook_app/widgets/custom_radio_button.dart';

final List listItem = ['day', 'month', 'year'];

class RadioButtonWidget extends StatefulWidget {
  final List listItem;
  const RadioButtonWidget({
    Key? key,
    required this.listItem,
  }) : super(key: key);

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  //ListItem item = widget.listItem.first;
  String item = '';
  @override
  Widget build(BuildContext context) {
    var listItem = widget.listItem;
    return Scaffold(
        body: Column(
      children: List.generate(
        listItem.length,
        (index) => ListTile(
          title: Text(listItem[index].toString()),
          leading: RadioButton<String>(
            value: listItem[index],
            groupValue: item,
            onChanged: (value) {
              setState(() {
                item = value!;
              });
            },
          ),
        ),
      ),
    ));
  }
}
