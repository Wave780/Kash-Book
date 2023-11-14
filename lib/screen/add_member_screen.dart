import 'package:flutter/material.dart';
import 'package:kashbook_app/screen/add_member_button.dart';
import 'package:kashbook_app/screen/viewrole_bottomsheet_screen.dart';
import 'package:kashbook_app/utils/images.dart';

class AddMemberScreen extends StatelessWidget {
  const AddMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Team'),
      ),
      body: Column(children: [
        const Image(image: AssetImage(AppAssetsImage.addMember)),
        const SizedBox(height: 80),
        const Divider(
          thickness: 1,
        ),
        InkWell(
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'View role & permission in detail',
                  style: TextStyle(fontSize: 15),
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
          onTap: () {
            const ViewRoleBottomSheetScreen();
          },
        ),
        const Divider(
          thickness: 1,
        ),
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
                          builder: (context) => const AddMemberButton()));
                },
                child: const Text('ADD TEAM MEMBER')))
      ]),
    );
  }
}
