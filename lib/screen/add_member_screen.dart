// Ask for permision first

import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

// Create the List
List<Contact> contacts = [];

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({super.key});

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  @override
  void initState() {
    super.initState();
    onReady();
    //askPermissions(null);
  }

  onReady() async {
    List<Contact> contact =
        await ContactsService.getContacts(withThumbnails: false);

    //contact = contact.where((element) => element.phones!.isNotEmpty).toList();
    setState(() {
      contacts = contact;
    });
  }

  Future<void> askPermissions(String? routeName) async {
    PermissionStatus premissionStatus = await getContactPermission();
    if (premissionStatus == PermissionStatus) {
      if (routeName != null) {
        Navigator.of(context as BuildContext).pushNamed(routeName);
      }
    } else {
      handleInvaildPermissions(premissionStatus);
    }
  }

  Future<PermissionStatus> getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  void handleInvaildPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      const snackBar = SnackBar(content: Text('Access to contact data denied'));
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(snackBar);
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      const snackBar =
          SnackBar(content: Text('Contat data not available on device'));
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Contacts Plugin Example')),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            Contact contact = contacts[index];

            var phones = contact.phones;
            return ListTile(
              title: Text(contact.displayName.toString()),
              subtitle:
                  Text((phones!.isEmpty ? 13 : phones[0].value).toString()),
            );
          },
        ));
  }
}
