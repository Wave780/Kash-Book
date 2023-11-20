import 'package:flutter/material.dart';
import 'package:kashbook_app/screen/add_member_button.dart';
import 'package:kashbook_app/widgets/custom_tesxtField_tile.dart';
import 'package:kashbook_app/widgets/custom_textfield.dart';

void createAcctountButtomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    enableDrag: true,
    isDismissible: true,
    builder: (context) => SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Create New Account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            const TextFieldTile(
              title: 'Enter New Account Name',
            ),
            const CustomTextField(),
            const SizedBox(
              height: 170,
            ),
            const Divider(
              thickness: 2,
            ),
            SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddMemberButton()));
                    },
                    child: const Text('ADD NEW ACCOUNT')))
          ],
        ),
      ),
    ),
  );
}
