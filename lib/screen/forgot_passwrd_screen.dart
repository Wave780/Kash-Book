import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kashbook_app/screen/create_acct_screen.dart';
import 'package:kashbook_app/utils/extension.dart';
import 'package:kashbook_app/widgets/custom_button.dart';
import 'package:kashbook_app/widgets/custom_tesxtField_tile.dart';
import 'package:kashbook_app/widgets/custom_textfield.dart';
import 'package:kashbook_app/widgets/custome_circle.dart';

class ForgottenPasswordScreen extends ConsumerWidget {
  static ForgottenPasswordScreen builder(
          BuildContext context, GoRouterState state) =>
      const ForgottenPasswordScreen();
  const ForgottenPasswordScreen({super.key});

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
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
              ),
              const Text('Reset your Password',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(
                height: 100.0,
              ),
              const TextFieldTile(
                title: 'Email',
              ),
              const CustomTextField(),
              const SizedBox(
                height: 90,
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
                    text: 'Reset',
                    colors: colors,
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    ));
  }
}
