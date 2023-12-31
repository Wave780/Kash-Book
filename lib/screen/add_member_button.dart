// Ask for permision first

import 'dart:typed_data';
import 'package:searchfield/searchfield.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:kashbook_app/utils/extension.dart';
import 'package:path/path.dart';

class AddMemberButton extends StatefulWidget {
  const AddMemberButton({super.key});

  @override
  State<AddMemberButton> createState() => _AddMemberButtonState();
}

class _AddMemberButtonState extends State<AddMemberButton> {
  TextEditingController searchController = TextEditingController();
  // Create the List
  List<Contact> contacts = [];
  List<Contact> contactFiltered = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      List<Contact> fetchedContacts = await ContactsService.getContacts();

      setState(() {
        contacts = fetchedContacts;
        isLoading = false;
      });
    });
    searchController.addListener(() {
      filterContacts();
    });
    //askPermissions(null);
  }

  void filterContacts() {
    List<Contact> contacts = [];
    contacts.addAll(contacts);
    if (searchController.text.isNotEmpty) {
      contacts.where((contact) {
        String searchItem = searchController.text.toLowerCase();
        String contactName = contact.displayName!.toLowerCase();
        // bool nameMatches = contactName.contains(searchItem);
        // if (nameMatches == true) {
        //   return true;
        // }
        return contactName.contains(searchItem);
      });
      setState(() {
        contactFiltered = contacts;
      });
    }
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
    final colors = context.colorScheme;
    bool isSearching = searchController.text.isNotEmpty;
    return Scaffold(
        appBar: AppBar(title: const Text('Add Team Member')),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Positioned(
                    bottom: 3.0,
                    right: 6.0,
                    child: SizedBox(
                      width: 150.0,
                      child: FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: colors.primary,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add),
                            Text('ADD MANUALLY'),
                          ],
                        ),
                      ),
                    )),
                Column(
                  children: [
                    TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          labelText: 'Search',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: colors.primary)),
                          prefixIcon: const Icon(Icons.search)),
                      onChanged: (value) {},
                    ),
                    Expanded(
                        child: FutureBuilder(
                            future: Future.delayed(const Duration(seconds: 2)),
                            builder: (context, snapshot) {
                              if (isLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: isSearching == true
                                    ? contactFiltered.length
                                    : contacts.length,
                                itemBuilder: (context, index) {
                                  Contact contact = isSearching == true
                                      ? contactFiltered[index]
                                      : contacts[index];

                                  var phones = contact.phones;
                                  return ListTile(
                                    trailing: InkWell(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //           ));
                                      },
                                      child: Text(
                                        'INVITE',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: colors.primary),
                                      ),
                                    ),
                                    title: Text(contact.displayName.toString()),
                                    subtitle: Text((phones!.isEmpty
                                            ? 'No phone number'
                                            : phones[0].value)
                                        .toString()),
                                    leading: (contact.avatar != null &&
                                            contact.avatar!.isNotEmpty)
                                        ? CircleAvatar(
                                            backgroundImage:
                                                MemoryImage(Uint8List(0)))
                                        : CircleAvatar(
                                            child: Text(contact.initials()),
                                          ),
                                  );
                                },
                              );
                            }))
                  ],
                ),
                SearchField<String>(
                  suggestions: contacts
                      .map(
                        (e) => SearchFieldListItem<String>(
                          e.displayName.toString(),
                          item: e.toString(),
                          // Use child to show Custom Widgets in the suggestions
                          // defaults to Text widget
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                // CircleAvatar(
                                //   backgroundImage: NetworkImage(e.flag),
                                // ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(e.displayName.toString()),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            )));
  }
}
