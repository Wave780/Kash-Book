import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kashbook_app/screen/screen.dart';
import 'package:kashbook_app/utils/images.dart';
import 'package:kashbook_app/utils/utils.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static SplashScreen builder(BuildContext context, GoRouterState state) =>
      const SplashScreen();
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    const duration = Duration(seconds: 5);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage(AppAssetsImage.appLogo),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'KASH BOOK',
          style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              color: colors.primary),
        )
      ],
    )));
  }
}
