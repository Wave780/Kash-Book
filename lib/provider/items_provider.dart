import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashbook_app/model/category_item.dart';

final itemsProvider = StateProvider<List<Item>>((ref) {
  return [];
});
