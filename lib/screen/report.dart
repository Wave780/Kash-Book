import 'package:flutter/material.dart';
import 'package:kashbook_app/screen/add_member_screen.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
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
                        'Report',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AddMemberScreen()));
                          },
                          icon: const Icon(Icons.settings_outlined))
                    ]),
                const SizedBox(height: 30),
                const Text('Generate Report'),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Column(
                      children: [Text('Date'), Text('All')],
                    ),
                    VerticalDivider(
                        width: 10, thickness: 3, color: Colors.amber),
                    Column(
                      children: [Text('Date'), Text('All')],
                    ),
                    VerticalDivider(
                      width: 5,
                      thickness: 3,
                      color: Colors.amber,
                    ),
                    Column(
                      children: [Text('Date'), Text('All')],
                    ),
                  ],
                )
              ])
            ])));
  }
}
