import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/data/body_tonning_workout_data.dart';
import 'package:fitnessapp/model/user.dart';
import 'package:fitnessapp/screens/home_related_screens/practice_screen.dart';
import 'package:fitnessapp/screens/tab_related_screens/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WorkOutSummaryScreen extends StatefulWidget {
  const WorkOutSummaryScreen({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  State<WorkOutSummaryScreen> createState() => _WorkOutSummaryScreenState();
}

class _WorkOutSummaryScreenState extends State<WorkOutSummaryScreen>
    with SingleTickerProviderStateMixin {
  String? _trainingLevel;
  String? _height;
  String? _weight;
  String? _fullName;
  String? _dob;
  String? _email;
  String? _gender;
  String? _goal;
  String? _interest;
  String? _phone;
  UserData? userDatas;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _animationController.forward();
  }

  Future<void> _loadUserData() async {
    var user = FirebaseAuth.instance.currentUser!;
    var userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    _trainingLevel = userData.data()!['trainingLevel'];
    _height = userData.data()!['height'];
    _weight = userData.data()!['weight'];
    _fullName = userData.data()!['fullName'];
    _dob = userData.data()!['dob'];
    _email = userData.data()!['email'];
    _gender = userData.data()!['gender'];
    _goal = userData.data()!['goal'];
    _interest = userData.data()!['interest'];
    _phone = userData.data()!['phone'];

    userDatas = UserData(
        trainingLevel: _trainingLevel,
        height: _height,
        weight: _weight,
        fullName: _fullName,
        dob: _dob,
        email: _email,
        gender: _gender,
        goal: _goal,
        interest: _interest,
        phone: _phone);
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('a', 60, 50),
      ChartData('b', 20, 140),
      ChartData('c', 50, 80),
      ChartData('d', 40, 100),
      ChartData('e', 20, 120),
      ChartData('f', 60, 50),
      ChartData('g', 40, 100),
      ChartData('h', 30, 130),
      ChartData('i', 60, 50),
      ChartData('j', 30, 120),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'summary',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.save_alt_rounded),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Workout',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                margin: const EdgeInsets.only(bottom: 15),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(15.0), // Adjust the value as needed
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 65,
                            width: 80,
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      bodyTonningLists[widget.currentIndex]
                                          .image),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                bodyTonningLists[widget.currentIndex].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                '08:30 - 09:15',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 133, 130, 130),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '00:45:15',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Total time',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 133, 130, 130),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '164',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    'bmp',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 133, 130, 130),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Avg Heart Rate',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 133, 130, 130),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '617',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    'Kcal',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 133, 130, 130),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Active Calories',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 133, 130, 130),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '640',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    'Kcal',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 133, 130, 130),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Total Calories',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 133, 130, 130),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Heart Rate',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(1, 0),
                          end: const Offset(0, 0),
                        ).animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: Curves.easeIn,
                          ),
                        ),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 5,
                          child: SfCartesianChart(
                            plotAreaBorderWidth: 0,
                            plotAreaBackgroundColor: Colors.transparent,
                            primaryXAxis: const CategoryAxis(
                                isVisible: false,
                                majorGridLines: MajorGridLines(
                                    width: 0, color: Colors.transparent),
                                majorTickLines: MajorTickLines(
                                    width: 0, color: Colors.transparent)),
                            primaryYAxis: const NumericAxis(
                                isVisible: true,
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                minimum: 0,
                                maximum: 200,
                                interval: 100,
                                majorGridLines: MajorGridLines(
                                    width: 0, color: Colors.transparent),
                                minorGridLines: MinorGridLines(
                                  width: 0,
                                  color: Colors.transparent,
                                ),
                                minorTickLines: MinorTickLines(
                                    width: 0, color: Colors.transparent)),
                            series: <CartesianSeries>[
                              StackedColumnSeries<ChartData, String>(
                                  width: 0.2,
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.transparent,
                                  dataSource: chartData,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y1),
                              StackedColumnSeries<ChartData, String>(
                                  width: 0.2,
                                  spacing: 0.1,
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20),
                                  dataSource: chartData,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y2),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (widget.currentIndex == bodyTonningLists.length - 1) {
                    Future.delayed(const Duration(milliseconds: 1), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TabScreen(
                            currentUser: userDatas!,
                          ),
                        ),
                      );
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PracticeScreen(
                          currentIndex: widget.currentIndex + 1,
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 208, 49, 25),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Save Workout',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(
    this.x,
    this.y1,
    this.y2,
  );
  final String x;
  final double y1;
  final double y2;
}
