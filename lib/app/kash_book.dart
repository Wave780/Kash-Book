import 'package:flutter/material.dart';
import 'package:kashbook_app/config/theme/app_theme.dart';

class KashBook extends StatelessWidget {
  const KashBook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
    );
  }
  
}
