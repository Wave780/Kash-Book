import 'package:flutter/material.dart';

class TextFieldTile extends StatelessWidget {
  const TextFieldTile({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0),
    );
  }
}