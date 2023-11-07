import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  final String prefixText;
  final String? greetText;

  const GreetingWidget({
    Key? key,
    required this.prefixText,
    this.greetText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final hour = now.hour;
    String greeting;
    if (hour < 12) {
      greeting = 'Good Morning';
    }
    if (hour < 17) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Evening';
    }
    return Row(
      children: [
        Text(prefixText,
            style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 18)),
        Text(greeting,
            style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 18))
      ],
    );
  }
}
