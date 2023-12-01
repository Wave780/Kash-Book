import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kashbook_app/utils/extension.dart';

class AddIconScreen extends ConsumerWidget {
  const AddIconScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    List<IconData> icons = [
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.cableCar,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
      FontAwesomeIcons.utensils,
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Wrap(
            spacing: 7,
            runSpacing: 7,
            children: icons.map((icon) {
              return CustomIconBox(
                onTap: () {},
                icon: icon,
                selectedColor: colors.primary,
                unSelectedColor: Colors.black,
              );
            }).toList()),
      ),
    );
  }
}

class CustomIconBox extends StatefulWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color selectedColor;
  final Color unSelectedColor;
  const CustomIconBox({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.selectedColor,
    required this.unSelectedColor,
  }) : super(key: key);

  @override
  State<CustomIconBox> createState() => _CustomIconBoxState();
}

class _CustomIconBoxState extends State<CustomIconBox> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return GestureDetector(
      onTap: () {
        widget.onTap;
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? widget.selectedColor : widget.unSelectedColor,
            ),
            borderRadius: BorderRadius.circular(8)),
        child: Icon(
          widget.icon,
          color: colors.primary,
        ),
      ),
    );
  }
}
