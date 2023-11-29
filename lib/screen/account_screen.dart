import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kashbook_app/provider/account_card_notifier.dart';
import 'package:kashbook_app/utils/extension.dart';
import 'package:kashbook_app/widgets/acctount_card.dart';

import 'create_account_buttom_sheet.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    
    final colors = context.colorScheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Account',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  IconButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             ));
                      },
                      icon: const Icon(Icons.search))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: numberFormate.length,
                    itemBuilder: (context, index) => Consumer(
                          builder: (BuildContext context, WidgetRef ref,
                              Widget? child) {
                            return InkWell(
                              onTap: () {
                                ref.watch(accountCardProvider.notifier).state =
                                    numberFormate[index];
                              },
                              child: AccountCard(
                                colors: colors,
                                formattedNumber: numberFormate[index],
                              ),
                            );
                          },
                        )),
              )
            ]),
            Positioned(
                bottom: 3.0,
                right: 6.0,
                child: SizedBox(
                  height: 60,
                  child: FloatingActionButton(
                    onPressed: () {
                      createAcctountButtomSheet(context);
                    },
                    backgroundColor: colors.inversePrimary,
                    child: const Icon(Icons.add),
                  ),
                )),
          ])),
    );
  }
}

List<dynamic> numberFormate = [
  NumberFormat.currency(
    symbol: '₦',
    locale: 'en_NG',  
  ).format(1000),
  NumberFormat.currency(
    symbol: '₦',
    locale: 'en_NG',
  ).format(3000),
  NumberFormat.currency(
    symbol: '₦',
    locale: 'en_NG',
  ).format(2000),
];
