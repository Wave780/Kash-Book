import 'package:flutter/material.dart';

import 'package:kashbook_app/utils/extension.dart';

class DropdownContainer extends StatefulWidget {
  final String text;
  final VoidCallback onTapAction;
  final Icon? dropArrowIcon;
  const DropdownContainer({
    Key? key,
    required this.text,
    required this.onTapAction,
    this.dropArrowIcon,
  }) : super(key: key);

  @override
  State<DropdownContainer> createState() => _DropdownContainerState();
}

class _DropdownContainerState extends State<DropdownContainer> {
  final List<bool> _checked = List<bool>.filled(5, true);

  void toggleCheckbox(int index) {
    setState(() {
      _checked[index] = !_checked[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    return InkWell(
        onTap: widget.onTapAction,
        child: Container(
          decoration: BoxDecoration(
              color: colors.onPrimary,
              borderRadius: BorderRadius.circular(9),
              border: Border.all(color: colors.primary)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(widget.text),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: colors.primary,
                )
              ],
            ),
          ),
        ));
  }
}
