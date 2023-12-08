import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashbook_app/provider/account_card_notifier.dart';
import 'package:kashbook_app/screen/screen.dart';
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

  var data; 
  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TranscationScreen()));
                  },
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
                Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    return AccountCard(
                        colors: colors,
                        formattedNumber:
                            ref.watch(accountCardProvider) ?? 'Select a card');
                  },
                ),
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
                                        RadioButtonWidget(listItem: selectDate),
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
                              builder: (context) => SizedBox(
                                    height: 200,
                                    child:
                                        RadioButtonWidget(listItem: entryType),
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
                              builder: (context) => SizedBox(
                                    height: 200,
                                    child: RadioButtonWidget(
                                        listItem: paymentMode),
                                  ));
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
                Center(
                    child: Text(
                  data ?? 'No Transcation',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ))
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
