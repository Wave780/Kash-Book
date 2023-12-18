import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashbook_app/provider/items_provider.dart';
import 'package:kashbook_app/screen/add_category_sccreen.dart';

import 'package:kashbook_app/utils/extension.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final savedItems = ref.watch(itemsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Category'),
      ),
      body: Stack(children: [
        ListView.builder(
            itemCount: savedItems.length,
            itemBuilder: (context, index) {
              if (savedItems.isEmpty) {
                return const SizedBox(
                  height: 50,
                  child: Center(
                    child: Text('No Item'),
                  ),
                );
              }
              final item = savedItems[index];
              // final icon = icons;
              return Dismissible(
                  key: Key(item.id.toString()),
                  onDismissed: (direction) {
                    ref.read(itemsProvider.notifier).state.remove(item);
                  },
                  child: ListTile(
                    leading: Icon(item.icon),
                    title: Text(item.name),
                  ));
            }),
        Positioned(
            bottom: 3.0,
            right: 6.0,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddCategoryScreen()));
              },
              backgroundColor: colors.primary,
              child: const Icon(Icons.add),
            )),
      ]),
    );
  }
}

// List<Item> itemTile = [
//   Item(name: 'Item 1', icon: Icons.add),
//   Item(name: 'Item 2', icon: Icons.safety_check),
//   Item(name: 'Item 3', icon: Icons.table_bar),
//   Item(name: 'Item 4', icon: Icons.umbrella),
// ];
