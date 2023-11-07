import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kashbook_app/utils/extension.dart';
import 'package:kashbook_app/widgets/greeting_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final nairaFormat = NumberFormat.currency(
      symbol: '₦',
      locale: 'en_NG',
    );
    final formattedNumber = nairaFormat.format(1000);
    final colors = context.colorScheme;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 20,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Home',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.person_2))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('John',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  GreetingWidget(
                    prefixText: 'Welcome,',
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Card(
                color: colors.primary,
                child: SizedBox(
                  height: 200,
                  width: 600,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account Name',
                          style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600,
                              color: colors.background),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Total Balance',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: colors.background),
                        ),
                        Text(
                          formattedNumber,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: colors.background),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Total',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: colors.background),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: Colors.green,
                                    ),
                                    Text(
                                      'Income',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: colors.background),
                                    )
                                  ],
                                ),
                                Text(
                                  formattedNumber,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: colors.background),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.arrow_drop_up_sharp,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      'Expense',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: colors.background),
                                    )
                                  ],
                                ),
                                Text(
                                  formattedNumber,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: colors.background),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
