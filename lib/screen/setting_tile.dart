import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.preffixIcon,
    required this.title,
    required this.onTap,
  });
  final IconData preffixIcon;
  final String title;
  final VoidCallback onTap;
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
