import 'package:flutter/material.dart';
import 'transcation_form.dart';

class TranscationScreen extends StatefulWidget {
  const TranscationScreen({super.key});

  @override
  State<TranscationScreen> createState() => _TranscationScreenState();
}

class _TranscationScreenState extends State<TranscationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transcation'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
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
              Expanded(
                  child: TabBarView(children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TranscationForm(),
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TranscationForm(),
                  ),
                )
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
