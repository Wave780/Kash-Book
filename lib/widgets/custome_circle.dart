import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  const CustomCircle({
    super.key,
    required this.colors,
  });

  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      width: 400.0,
      decoration: BoxDecoration(color: colors, shape: BoxShape.circle),
    );
  }
}
