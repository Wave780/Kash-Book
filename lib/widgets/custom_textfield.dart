import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.controller,
    super.key, this.onChanged,
  });
  final Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      decoration: const InputDecoration(
          fillColor: Colors.white, filled: true, border: InputBorder.none),
    );
  }
}

class CustomNumTextField extends StatelessWidget {
  final String hintText;
  const CustomNumTextField({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+\.?[0-9]{0,1}')),
      ],
      decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.white,
          filled: true,
          border: InputBorder.none),
    );
  }
}
