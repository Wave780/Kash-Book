import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kashbook_app/screen/add_member_screen.dart';
import 'package:kashbook_app/utils/extension.dart';
import 'package:kashbook_app/widgets/acctount_card.dart';
import 'package:kashbook_app/widgets/container_selector.dart';
import 'package:kashbook_app/widgets/greeting_widget.dart';
import 'package:kashbook_app/widgets/radio_button_widget.dart';

const List<String> list = <String>['Day', 'Month', 'Year'];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String drpodownValue = list.first;
  @override
  Widget build(BuildContext context) {
    final nairaFormat = NumberFormat.currency(
      symbol: '₦',
      locale: 'en_NG',
    );
    final formattedNumber = nairaFormat.format(1000);
    final colors = context.colorScheme;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          toolbarHeight: 20,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(children: [
            Positioned(
                bottom: 3.0,
                right: 6.0,
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: colors.primary,
                  child: const Icon(Icons.add),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Home',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddMemberScreen()));
                        },
                        icon: const Icon(Icons.person_2))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('John',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    GreetingWidget(
                      prefixText: 'Welcome,',
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                AccountCard(colors: colors, formattedNumber: formattedNumber),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      DropdownContainer(
                        text: '',
                        dropArrowIcon: const Icon(Icons.abc),
                        onTapAction: () {
                          // showModalBottomSheet(
                          //     context: context,
                          //     builder: (context) => const SizedBox(
                          //           height: 200,
                          //           child: RadioButtonWidget(),
                          //         ));
                          // print('object');
                          ButtomSheet().showBottomSheet(
                              context: _scaffoldKey.currentContext!);
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      DropdownContainer(
                        text: 'Select Date',
                        onTapAction: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => SizedBox(
                                    height: 200,
                                    child:
                                        RadioButtonWidget(listItem: listItem),
                                  ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      DropdownContainer(
                        text: 'Entry Type',
                        onTapAction: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => const SizedBox(
                                    height: 200,
                                    //child: RadioButtonWidget(),
                                  ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      DropdownContainer(
                        text: 'Payment Mode',
                        onTapAction: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => const SizedBox(
                                    height: 200,
                                    //child: RadioButtonWidget(),
                                  ));
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ]),
        ));
  }
}

class ButtomSheet {
  void showBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const SizedBox(
        height: 200,
        // child: RadioButtonWidget(),
      ),
    );
  }
}
