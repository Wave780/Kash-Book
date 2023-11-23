import 'package:flutter/material.dart';
import 'package:kashbook_app/utils/extension.dart';

class DetailAccountCard extends StatelessWidget {
  const DetailAccountCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    return Card(
      color: colors.primary,
      child: SizedBox(
        height: 100,
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Account Name',
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    color: colors.background))
          ],
        ),
      ),
    );
  }
}
