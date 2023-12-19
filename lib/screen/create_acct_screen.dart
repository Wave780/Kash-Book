import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kashbook_app/provider/auth_service_provider.dart';
import 'package:kashbook_app/provider/show_password..dart';
import 'package:kashbook_app/screen/login_screen.dart';
import 'package:kashbook_app/utils/extension.dart';
import 'package:kashbook_app/widgets/custom_button.dart';
import 'package:kashbook_app/widgets/custom_tesxtField_tile.dart';
import 'package:kashbook_app/widgets/custom_textfield.dart';
import 'package:kashbook_app/widgets/custome_circle.dart';

class CreateAcctScreen extends ConsumerWidget {
  static CreateAcctScreen builder(BuildContext context, GoRouterState state) =>
      CreateAcctScreen();
  CreateAcctScreen({super.key});

  bool showPassword = true;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  // @override
  // void dispose() {
  //   super.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  // }

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
              height: deviceSize.height * 0.1,
              width: deviceSize.width,
            ),
            const Text('Create Account with Us!',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            // const Text(
            //   'Enter your Username & Password',
            //   style: TextStyle(fontSize: 20, color: Colors.white),
            // ),
            const SizedBox(
              height: 60.0,
            ),
            const TextFieldTile(
              title: 'Full Name',
            ),
            const CustomTextField(),
            const SizedBox(
              height: 25.0,
            ),
            const TextFieldTile(
              title: 'Email',
            ),
            CustomTextField(controller: emailController),
            const SizedBox(
              height: 25.0,
            ),
            const TextFieldTile(
              title: 'Password',
            ),
            CustomTextField(
              controller: passwordController,
              obscureText: ref.watch(showPasswordProvider),
              suffixIcon: IconButton(
                  icon: Icon(
                      showPassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    ref.read(showPasswordProvider.notifier).state =
                        !showPassword;
                  }),
            ),
            const SizedBox(
              height: 25.0,
            ),
            const TextFieldTile(
              title: 'Confirm Password',
            ),
            const CustomTextField(),
            const SizedBox(
              height: 70,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  ref.watch(authServiceProvider)!.signUpWithEmail(
                      email: emailController.text,
                      password: passwordController.text,
                      context: context);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>  CreateAcctScreen()));
                },
                child: CustomButton(
                  deviceSize: deviceSize.width * 0.70,
                  text: 'Sign Up',
                  colors: colors,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: Text('Sign In',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: colors.primary)),
                )
              ],
            )
          ],
        ),
      )
    ])));
  }
}
