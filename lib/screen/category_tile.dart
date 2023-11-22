import 'package:flutter/material.dart';
import 'package:kashbook_app/utils/extension.dart';

class CategoryTile extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback onTap;
  const CategoryTile({
    Key? key,
    required this.name,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        width: 100,
        child: Container(
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: colors.primary, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(icon, color: colors.primary),
                  Text(
                    name,
                    style: TextStyle(color: colors.primary),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
