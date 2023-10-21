import 'package:flutter/material.dart';

// final bottomNavBarProvider = Provider<ButtomNavBar>((ref) {
//   return ButtomNavBar(
//     destinations: const [],
//     onItemTap: (int index) {},
//   );
// });

class ButtomNavBar extends StatefulWidget {
  final List<NavigationDestination> destinations;
  final NavigationDestinationLabelBehavior? labelBehavior;
  final int selectedIndex;
  final void Function(int index) onItemTap;
  final Color? backgroundColor;
  const ButtomNavBar({
    Key? key,
    required this.destinations,
    this.labelBehavior,
    this.selectedIndex = 0,
    required this.onItemTap,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<ButtomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();

    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelBehavior: widget.labelBehavior,
      backgroundColor: widget.backgroundColor,
      selectedIndex: _selectedIndex,
      onDestinationSelected: (int tappedIndex) {
        setState(() {
          _selectedIndex = tappedIndex;
        });

        widget.onItemTap(tappedIndex);
      },
      destinations: widget.destinations,
    );
  }
}
