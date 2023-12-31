import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  TooltipBehavior tooltipBehavior = TooltipBehavior();
  late List<SalesData> data;

  @override
  void initState() {
    data = [
      SalesData('Transport', 12, Colors.amber),
      SalesData('Fuel', 15, Colors.purple),
      SalesData('Gas', 30, Colors.pink),
      SalesData('Gift', 6.4, Colors.blue),
      SalesData('Meal', 14, Colors.green)
    ];
    tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 20,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Statistics',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          )
                        ]),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DefaultTabController(
                            length: 2,
                            child: Column(children: [
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
                              SizedBox(
                                height: 580,
                                child: TabBarView(children: [
                                  GraphsWidget(
                                      tooltipBehavior: tooltipBehavior,
                                      data: data),
                                  GraphsWidget(
                                      tooltipBehavior: tooltipBehavior,
                                      data: data)
                                ]),
                              )
                            ])))
                  ])),
        ]));
  }
}

class GraphsWidget extends StatelessWidget {
  const GraphsWidget({
    super.key,
    required this.tooltipBehavior,
    required this.data,
  });

  final TooltipBehavior tooltipBehavior;
  final List<SalesData> data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
            title: ChartTitle(text: 'Monthly'),
            tooltipBehavior: tooltipBehavior,
            series: <ChartSeries<SalesData, String>>[
              BarSeries<SalesData, String>(
                  dataSource: data,
                  name: 'Monthly',
                  pointColorMapper: (SalesData sales, _) => sales.color,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  xValueMapper: (SalesData sales, _) => sales.year,
                  dataLabelSettings: const DataLabelSettings(isVisible: true)),
            ],
          ),
          SfCircularChart(
            title: ChartTitle(text: 'Daily'),
            legend: const Legend(
                isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            tooltipBehavior: tooltipBehavior,
            series: <CircularSeries>[
              PieSeries<SalesData, String>(
                  dataSource: data,
                  pointColorMapper: (SalesData sales, _) => sales.color,
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  dataLabelSettings: const DataLabelSettings(isVisible: true))
            ],
          ),
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales, this.color);
  final String year;
  final double sales;
  final Color? color;
}
