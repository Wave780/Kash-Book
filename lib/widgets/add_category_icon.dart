import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:kashbook_app/model/category_icon_model.dart';

class AddIconScreen extends ConsumerWidget {
  const AddIconScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final icons = [IconModel(icon: Icons.abc)];
    return const Placeholder();
  }
}
