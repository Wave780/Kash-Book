import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:kashbook_app/screen/screen.dart';
import 'package:kashbook_app/utils/extension.dart';
import 'package:kashbook_app/widgets/custom_button.dart';
import 'package:kashbook_app/widgets/custome_circle.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        Positioned(
          right: 90,
          top: -20.0,
          child: CustomCircle(colors: colors.primary),
        ),
        Positioned(
          left: 90,
          top: 100.0,
          child: CustomCircle(colors: colors.inversePrimary),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: deviceSize.height * 0.2,
                width: deviceSize.width,
              ),
              const Text('Welcome to Kash Book!',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const Text(
                'Enter your Username & Password',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(
                height: 100.0,
              ),
              const TextFieldTile(
                title: 'Email',
              ),
              const CustomTextField(),
              const SizedBox(
                height: 40.0,
              ),
              const TextFieldTile(
                title: 'Password',
              ),
              const CustomTextField(),
              const SizedBox(
                height: 70,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateAcctScreen()));
                  },
                  child: CustomButton(
                    deviceSize: deviceSize.width * 0.70,
                    text: 'Login',
                    colors: colors,
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    ));
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
          fillColor: Colors.transparent,
          filled: true,
          border: InputBorder.none),
    );
  }
}

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
