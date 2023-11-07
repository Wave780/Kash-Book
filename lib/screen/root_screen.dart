import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kashbook_app/widgets/buttom_navbar.dart';
import 'package:kashbook_app/widgets/side_navbar.dart';

class RootScreen extends ConsumerWidget {
  static RootScreen builder(BuildContext context, GoRouterState state) =>
      const RootScreen();
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sideNaveBar = ref.watch(sideNavBarProvider);

    return Scaffold(
      drawer: sideNaveBar,
      bottomNavigationBar: const ButtomNavBar(),
    );
  }
}
