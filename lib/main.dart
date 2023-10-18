import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashbook_app/app/kash_book.dart';

void main() {
  runApp(const ProviderScope(child: KashBook()));
}
