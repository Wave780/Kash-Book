import 'package:flutter/material.dart';
import 'package:kashbook_app/screen/category_tile.dart';
import 'package:kashbook_app/screen/screen.dart';
import 'package:kashbook_app/screen/selector_button.dart';
import 'package:kashbook_app/screen/time_date_picker.dart';
import 'package:kashbook_app/widgets/custom_tesxtField_tile.dart';
import 'package:kashbook_app/widgets/custom_textfield.dart';
import 'package:kashbook_app/widgets/detail_account_card.dart';

class TranscationForm extends StatelessWidget {
  const TranscationForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextFieldTile(
          title: 'Name',
        ),
        const CustomTextField(),
        const TextFieldTile(
          title: 'Amount',
        ),
        const CustomNumTextField(
          hintText: '0.00',
        ),
        const TextFieldTile(
          title: 'Description',
        ),
        const CustomTextField(),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 200,
          child: OutlinedButton(
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.attachment_sharp),
                  SizedBox(
                    width: 15,
                  ),
                  Text('Attach Image or PDF'),
                ],
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        const TimeDatePicker(),
        const SizedBox(
          height: 20,
        ),
        const TextFieldTile(
          title: 'Category',
        ),
        Wrap(
          spacing: 1,
          children: [
            CategoryTile(
              name: 'Transpot',
              icon: Icons.bus_alert,
              onTap: () {},
            ),
            CategoryTile(
              name: 'Fuel',
              icon: Icons.bus_alert,
              onTap: () {},
            ),
            CategoryTile(
              name: 'Gas',
              icon: Icons.bus_alert,
              onTap: () {},
            ),
            CategoryTile(
              name: 'Maintance',
              icon: Icons.construction,
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const TextFieldTile(
          title: 'Select Account',
        ),
        const SizedBox(
          height: 10,
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DetailAccountCard(),
              DetailAccountCard(),
              DetailAccountCard(),
              DetailAccountCard(),
              DetailAccountCard(),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const TextFieldTile(
          title: 'Paymant Mode',
        ),
        const SizedBox(
          height: 10,
        ),
        const Selector(),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            width: 350,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                child: const Text('SAVE')))
      ],
    );
  }
}
