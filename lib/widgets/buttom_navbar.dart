import 'package:flutter/material.dart';
import 'package:kashbook_app/screen/screen.dart';

class ButtomNavBar extends StatefulWidget {
  const ButtomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<ButtomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int tappedIndex) {
          setState(() {
            selectedIndex = tappedIndex;
          });
        },
        selectedIndex: selectedIndex,
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
              icon: Icon(Icons.note_alt_outlined),
              selectedIcon: Icon(Icons.note_alt),
              label: 'Transcation'),
          NavigationDestination(
              icon: Icon(Icons.pie_chart_outline),
              selectedIcon: Icon(Icons.pie_chart),
              label: 'Statistics')
        ],
      ),
      body: <Widget>[
        const HomeScreen(),
        const AccountScreen(),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
        const StatisticsScreen()
      ][selectedIndex],
    );
  }
}
