import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashbook_app/model/category_item.dart';
import 'package:kashbook_app/provider/items_provider.dart';
import 'package:kashbook_app/screen/screen.dart';
import 'package:kashbook_app/widgets/add_category_icon.dart';

import 'package:kashbook_app/widgets/custom_tesxtField_tile.dart';
import 'package:kashbook_app/widgets/custom_textfield.dart';

class AddCategoryScreen extends StatelessWidget {
  const AddCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itemTitle = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 20,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'New Category',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(height: 25),
            const TextFieldTile(
              title: 'Item title',
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: itemTitle,
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => const AddIconScreen());
                },
                child: const Text('Select an Icons')),
            const SizedBox(
              height: 50,
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return SizedBox(
                    width: 350,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          final newItem = Item(
                            name: itemTitle.text,
                            icon: Icons.podcasts,
                          );

                          ref
                              .read(itemsProvider.notifier)
                              .update((items) => items += [newItem]);
                          itemTitle.clear();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CategoryScreen()));
                        },
                        child: const Text('ADD ITEM')));
              },
            )
          ]),
        ));
  }
}
