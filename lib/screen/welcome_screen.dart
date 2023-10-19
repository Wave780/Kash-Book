import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kashbook_app/screen/login_screen.dart';
import 'package:kashbook_app/utils/utils.dart';
import 'package:kashbook_app/widgets/custom_button.dart';
import 'package:kashbook_app/widgets/custome_circle.dart';

class WelcomeScreen extends ConsumerWidget {
  static WelcomeScreen builder(BuildContext context, GoRouterState state) =>
      const WelcomeScreen();
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    return Scaffold(
      body: Stack(children: [
        Positioned(
          left: 90,
          top: -20.0,
          child: CustomCircle(colors: colors.primary),
        ),
        Positioned(
          right: 90,
          top: 100.0,
          child: CustomCircle(colors: colors.inversePrimary),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Time to Record your Money',
                style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: colors.primary),
              ),
              const Text(
                'Time to Record your Money',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: CustomButton(
                    deviceSize: deviceSize.width * 0.70,
                    colors: colors,
                    text: 'Join Now',
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
