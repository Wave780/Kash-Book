import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kashbook_app/widgets/buttom_navbar.dart';
import 'package:kashbook_app/widgets/side_navbar.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sideNaveBar = ref.watch(sideNavBarProvider);
    //  final bottomNaveBar = ref.watch(bottomNavBarProvider);
    return Scaffold(
      drawer: sideNaveBar,
      bottomNavigationBar: ButtomNavBar(
        onItemTap: (int tappedIndex) {},
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.account_balance_wallet_outlined),
              selectedIcon: Icon(Icons.account_balance_wallet),
              label: 'Account'),
          NavigationDestination(
              icon: Icon(Icons.account_balance_outlined),
              selectedIcon: Icon(Icons.account_balance_rounded),
              label: 'Debit'),
          NavigationDestination(
              icon: Icon(Icons.auto_graph_outlined),
              selectedIcon: Icon(Icons.auto_graph_sharp),
              label: 'Overview')
        ],
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
