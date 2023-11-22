import 'package:flutter/material.dart';

import 'package:kashbook_app/utils/extension.dart';

class SelectorButton extends StatefulWidget {
  final List<String> options;
  final int selectedIndex;
  final void Function(int) onChanged;
  const SelectorButton({
    Key? key,
    required this.options,
    required this.selectedIndex,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<SelectorButton> createState() => _SelectorButtonState();
}
class _SelectorButtonState extends State<SelectorButton> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    return Wrap(
      spacing: 30,
      children: widget.options.asMap().entries.map((entry) {
        final index = entry.key;
        final option = entry.value;
        final isSelected = index == widget.selectedIndex;
        return GestureDetector(
          onTap: () => widget.onChanged(index),
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: isSelected ? colors.inversePrimary : Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(option),
          ),
        );
      }).toList(),
    );
  }
}

class SelectedIndexProvider {
  int selectedIndex = 0;
}

class Selector extends StatefulWidget {
  const Selector({super.key});

  @override
  State<Selector> createState() => _SelectorState();
}

class _SelectorState extends State<Selector> {
  final selectedIndexProvider = SelectedIndexProvider();

  @override
  Widget build(BuildContext context) {
    return SelectorButton(
      options: const [
        'Online',
        'Cash',
      ],
      selectedIndex: selectedIndexProvider.selectedIndex,
      onChanged: (index) => setState(() {
        selectedIndexProvider.selectedIndex = index;
      }),
    );
  }
}
