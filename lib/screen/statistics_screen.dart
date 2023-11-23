import 'package:flutter/material.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 20,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Stack(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Statistics',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      )
                    ]),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: DefaultTabController(
                        length: 2,
                        child: Column(children: [
                          TabBar(tabs: [
                            Tab(
                              child: Text(
                                'Income',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Expense',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            ),
                          ]),
                        ])))
              ])
            ])));
  }
}
