import 'package:flutter/material.dart';
import 'package:kashbook_app/screen/screen.dart';
import 'package:kashbook_app/widgets/custom_tesxtField_tile.dart';
import 'package:kashbook_app/widgets/custom_textfield.dart';

import 'time_date_picker.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const TabBar(tabs: [
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextFieldTile(
                        title: 'Name',
                      ),
                      const CustomTextField(),
                      const TextFieldTile(
                        title: 'Amount',
                      ),
                      const CustomTextField(),
                      const TextFieldTile(
                        title: 'Description',
                      ),
                      const CustomTextField(),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 200,
                        child: OutlinedButton(
                            onPressed: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.attachment_sharp),
                                SizedBox(
                                  width: 15,
                                ),
                                Text('Attach Imagenor PDF'),
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const TimeDatePicker(),
                      SizedBox(
                          width: 350,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()));
                              },
                              child: const Text('SAVE')))
                    ],
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
