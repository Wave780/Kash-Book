import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.deviceSize,
    required this.colors,
    required this.text,
  });

  final double deviceSize;
  final ColorScheme colors;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceSize,
      decoration: BoxDecoration(
          color: colors.inversePrimary,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 25.0),
          ),
        ),
      ),
    );
  }
}