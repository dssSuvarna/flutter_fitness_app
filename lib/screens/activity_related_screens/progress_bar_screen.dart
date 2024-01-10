import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:fitnessapp/data/training_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

final formattedDate = DateFormat("MMM dd, yyyy").format(DateTime.now());

class ProgressBarScreen extends ConsumerStatefulWidget {
  const ProgressBarScreen({super.key});

  @override
  ConsumerState<ProgressBarScreen> createState() => _ProgressBarScreenState();
}

class _ProgressBarScreenState extends ConsumerState<ProgressBarScreen>
    with SingleTickerProviderStateMixin {
  bool _monthClicked = false;
  bool _weekClicked = true;
  bool _yearClicked = false;
  List<Training> favoriteTrainings = [];
  List<PopularWorkouts> favoriteWorkouts = [];

  late AnimationController _animationController;
  late List<_ChartData> data;
  late List<_ChartData> lineData;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _animationController.forward();

    data = [
      _ChartData('Sa', 800),
      _ChartData('S', 600),
      _ChartData('M', 900),
      _ChartData('Tu', 400),
      _ChartData('W', 600),
      _ChartData('T', 300),
      _ChartData('F', 700),
    ];
    lineData = [
      _ChartData('Sa', 53),
      _ChartData('S', 52.5),
      _ChartData('M', 53.2),
      _ChartData('Tu', 52.3),
      _ChartData('W', 52.8),
      _ChartData('T', 52.2),
      _ChartData('F', 52.8),
    ];
    _tooltip = TooltipBehavior(enable: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Progress',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Training history',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, -1.5),
                  end: const Offset(0, 0),
                ).animate(
                  CurvedAnimation(
                    parent: _animationController,
                    curve: Curves.bounceOut,
                  ),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 7,
                  child: DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: const Color.fromARGB(255, 208, 49, 25),
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      // New date selected
                      setState(() {});
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        15.0), // Adjust the value as needed
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _weekClicked = true;
                                _monthClicked = false;
                                _yearClicked = false;
                              });
                            },
                            child: Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              decoration: _weekClicked
                                  ? BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 208, 49, 25),
                                      borderRadius: BorderRadius.circular(15.0),
                                    )
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                              child: _weekClicked
                                  ? const Text(
                                      'Week',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    )
                                  : const Text(
                                      'Week',
                                      textAlign: TextAlign.center,
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _weekClicked = false;
                                _monthClicked = true;
                                _yearClicked = false;
                              });
                            },
                            child: Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              decoration: _monthClicked
                                  ? BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 208, 49, 25),
                                      borderRadius: BorderRadius.circular(15.0),
                                    )
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                              child: _monthClicked
                                  ? const Text(
                                      'Month',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    )
                                  : const Text(
                                      'Month',
                                      textAlign: TextAlign.center,
                                    ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _weekClicked = false;
                                _monthClicked = false;
                                _yearClicked = true;
                              });
                            },
                            child: Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              decoration: _yearClicked
                                  ? BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 208, 49, 25),
                                      borderRadius: BorderRadius.circular(15.0),
                                    )
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                              child: _yearClicked
                                  ? const Text(
                                      'Year',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    )
                                  : const Text(
                                      'Year',
                                      textAlign: TextAlign.center,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Weight tracking',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'History',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3.5,
                        child: SfCartesianChart(
                          plotAreaBorderWidth: 0,
                          plotAreaBackgroundColor: Colors.transparent,
                          primaryXAxis: const CategoryAxis(
                              labelStyle: TextStyle(color: Colors.black),
                              majorGridLines: MajorGridLines(
                                  width: 0, color: Colors.transparent),
                              majorTickLines: MajorTickLines(
                                  width: 0, color: Colors.transparent)),
                          primaryYAxis: const NumericAxis(
                            majorTickLines: MajorTickLines(size: 0),
                            labelStyle: TextStyle(color: Colors.black),
                            interval: 1,
                            minimum: 51,
                            maximum: 55,
                            majorGridLines: MajorGridLines(
                                width: 0, color: Colors.transparent),
                            minorGridLines: MinorGridLines(
                                width: 0, color: Colors.transparent),
                            minorTickLines: MinorTickLines(
                                width: 0, color: Colors.transparent),
                          ),
                          series: <CartesianSeries>[
                            StackedLineSeries<_ChartData, String>(
                              groupName: 'Group A',
                              color: Colors.red,
                              dataLabelSettings: const DataLabelSettings(
                                isVisible:
                                    false, // Hide data labels for Group A
                                useSeriesColor: true,
                              ),
                              dataSource: lineData,
                              markerSettings: MarkerSettings(isVisible: true),
                              xValueMapper: (_ChartData data, _) => data.x,
                              yValueMapper: (_ChartData data, _) => data.y,
                            ),
                            StackedLineSeries<_ChartData, String>(
                              groupName: 'Group B',
                              color: Colors.red,
                              dataLabelSettings: const DataLabelSettings(
                                isVisible: false,
                                useSeriesColor: true,
                              ),
                              dataSource: lineData,
                              markerSettings: const MarkerSettings(
                                  isVisible: true, color: Colors.red),
                              xValueMapper: (_ChartData data, _) => data.x,
                              yValueMapper: (_ChartData data, _) => data.y,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Calories burned',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3.5,
                        child: SfCartesianChart(
                          plotAreaBorderWidth: 0,
                          plotAreaBackgroundColor: Colors.transparent,
                          primaryXAxis: const CategoryAxis(
                            labelStyle: TextStyle(color: Colors.black),
                            majorGridLines: MajorGridLines(
                                width: 0, color: Colors.transparent),
                            majorTickLines: MajorTickLines(
                                width: 0, color: Colors.transparent),
                          ),
                          primaryYAxis: const NumericAxis(
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            minimum: 0,
                            maximum: 1000,
                            interval: 500,
                            majorGridLines: MajorGridLines(
                                width: 0, color: Colors.transparent),
                            minorGridLines: MinorGridLines(
                              width: 0,
                              color: Colors.transparent,
                            ),
                            minorTickLines: MinorTickLines(
                                width: 0, color: Colors.transparent),
                          ),
                          tooltipBehavior: _tooltip,
                          series: <CartesianSeries<_ChartData, String>>[
                            ColumnSeries<_ChartData, String>(
                              dataSource: data,
                              xValueMapper: (_ChartData data, _) => data.x,
                              yValueMapper: (_ChartData data, _) => data.y,
                              color: Colors.red,
                              width: 0.2,
                              borderRadius: BorderRadius.circular(20),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

class SalesData {
  SalesData(this.day, this.sales);
  final String day;
  final double sales;
}
