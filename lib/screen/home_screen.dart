import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 20,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Home',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.person_2))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('John',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  GreetingWidget(
                    prefixText: 'Welcome,',
                  )
                ],
              )
            ],
          ),
        ));
  }
}

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
