import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.preffixIcon,
    required this.title,
    this.onTap, this.child,
  });
  final IconData preffixIcon;
  final String title;
  final Widget? child;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Icon(
            preffixIcon,
          ),
          const SizedBox(width: 5),
          Text(title),
        ],
      ),
      onTap: () {},
    );
  }
}
