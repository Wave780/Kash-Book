import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:kashbook_app/config/config.dart';

class KashBook extends ConsumerWidget {
  const KashBook({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeConfig = ref.watch(routesProvider);
    return MaterialApp.router(
      routerConfig: routeConfig,
      title: 'Kash Book',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
