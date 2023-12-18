import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashbook_app/model/category_item.dart';
import 'package:kashbook_app/provider/items_provider.dart';
import 'package:kashbook_app/provider/selected_icon_provider.dart';
import 'package:kashbook_app/screen/screen.dart';
import 'package:kashbook_app/utils/extension.dart';
import 'package:kashbook_app/widgets/add_category_icon.dart';

import 'package:kashbook_app/widgets/custom_tesxtField_tile.dart';
import 'package:kashbook_app/widgets/custom_textfield.dart';

class AddCategoryScreen extends ConsumerStatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  ConsumerState<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends ConsumerState<AddCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final itemTitle = TextEditingController();

    final colors = context.colorScheme;

    final selectedIcon = ref.read(iconProvider);
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
            const Text('Select an Icons'),
            Wrap(
                spacing: 7,
                runSpacing: 7,
                children: icons.map((icon) {
                  return CustomIconBox(
                    onTap: () {
                      ref.read(iconProvider.notifier).state = icon;
                    },
                    isSelected: selectedIcon == icon,
                    icon: icon,
                    selectedColor: colors.primary,
                    unSelectedColor: Colors.black,
                  );
                }).toList()),
            // OutlinedButton(
            //     onPressed: () {
            //       showModalBottomSheet(
            //           context: context,
            //           builder: (context) => const AddIconScreen());
            //     },
            //     child: const Text('Select an Icons')),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      if (selectedIcon != null) {
                        final newItem = Item(
                          name: itemTitle.text,
                          icon: selectedIcon,
                        );

                        ref
                            .watch(itemsProvider.notifier)
                            .update((items) => items += [newItem]);
                        itemTitle.clear();
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CategoryScreen()));
                    },
                    child: const Text('ADD ITEM')))
          ]),
        ));
  }
}
