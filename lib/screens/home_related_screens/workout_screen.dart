import 'dart:async';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:fitnessapp/data/exercises_data.dart';
import 'package:fitnessapp/screens/home_related_screens/exercise_information.dart';
import 'package:fitnessapp/screens/home_related_screens/music_provider_screen.dart';
import 'package:fitnessapp/screens/home_related_screens/practice_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class WorkOutScreen extends StatefulWidget {
  WorkOutScreen({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
  }) : super(key: key);
  String image;
  String name;
  String description;

  @override
  State<WorkOutScreen> createState() => _WorkOutScreenState();
}

class _WorkOutScreenState extends State<WorkOutScreen> {
  final ScrollController _scrollController = ScrollController();
  double percent = 0.0;
  late Timer timer;
  List<Exercise> favoriteExercises = [];

  @override
  void initState() {
    super.initState();
    _startLoadingTimer();
  }

  void _startLoadingTimer() {
    setState(() {
      percent = 0.0;
    });

    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (Timer timer) {
      if (mounted) {
        setState(() {
          if (percent >= 1) {
            percent = 1.0; // Clamp percent to 1.0
            timer.cancel();
          } else {
            percent +=
                1 / 30; // Update the progress every second for 30 seconds
            if (percent >= 1) {
              percent =
                  1.0; // Clamp percent again to handle any rounding errors
              timer.cancel();
            }
          }
        });
      } else {
        timer.cancel(); // Cancel the timer if the state is not mounted
      }
    });
  }

  void _scheduleWorkout(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      builder: (cnx) => Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SvgPicture.asset(
                  'assets/images/img_close_12X12.svg',
                  width: 15,
                  height: 15,
                  alignment: Alignment.centerRight,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Schedule-workout',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
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
              const SizedBox(
                height: 120,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
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
                  'Schedule',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _displayInformation(
      String image, String name, String description, List<String> techniques) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 1,
          child: ExerciseInformationScreen(
            image: image,
            name: name,
            description: description,
            techniques: techniques,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    timer.cancel(); // Cancel the timer when the screen is disposed
    super.dispose();
  }

  void _restartTimer() {
    setState(() {
      percent = 0.0;
    });

    if (timer.isActive) {
      timer.cancel(); // Cancel the existing timer if active
    }

    _startLoadingTimer(); // Restart the timer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Text(widget.description),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 231, 227, 227),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.timer_sharp),
                                    Text(
                                      '30 min',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 231, 227, 227),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text(
                                      '🔥',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      '340 Kal',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 231, 227, 227),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text('⚡', style: TextStyle(fontSize: 18)),
                                    Text(
                                      'Beginner',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Equipment',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '2 Items',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 133, 130, 130)),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 10, 10, 10),
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/img_7xm33.png'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    '2 Dumbells',
                                    textAlign: TextAlign.left,
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 10, 10, 10),
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/img_7xm33_76X102.png'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Mat',
                                    textAlign: TextAlign.left,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _scheduleWorkout(context);
                                },
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Schedule workout'),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Color.fromARGB(255, 231, 227, 227),
                                      size: 15,
                                    )
                                  ],
                                ),
                              ),
                              const Divider(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MusicProviderScreen(),
                                    ),
                                  );
                                },
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Pick a Playlist'),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Color.fromARGB(255, 231, 227, 227),
                                      size: 15,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Exercises',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Warm-up',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '3 Exercises .',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 133, 130, 130)),
                                  ),
                                  Text(
                                    '2 Minutes',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 133, 130, 130)),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              for (final exercise in exercises.take(2))
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget.image = exercise.image;
                                      widget.name = exercise.name;
                                      widget.description = exercise.description;
                                    });
                                    _scrollController.animateTo(
                                      0.0,
                                      duration: const Duration(
                                          milliseconds:
                                              500), // You can adjust the duration as needed
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 15),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 231, 227, 227),
                                        width: 1.0, // Border width
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          12.0), // Optional: for rounded corners
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 5, 10, 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 50,
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 10, 10, 10),
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          exercise.image),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    exercise.name,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    exercise.time,
                                                    style: const TextStyle(
                                                        fontSize: 13,
                                                        color: Color.fromARGB(
                                                            255,
                                                            133,
                                                            130,
                                                            130)),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              _displayInformation(
                                                  exercise.image,
                                                  exercise.name,
                                                  exercise.description,
                                                  exercise.techniques);
                                            },
                                            child: SvgPicture.asset(
                                              exercise.iconImage,
                                              // You can customize width, height, color, etc.
                                              width: 20,
                                              height: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              Card(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: _restartTimer,
                                      child: CircularPercentIndicator(
                                        radius: 30.0,
                                        lineWidth: 5.0,
                                        percent: percent,
                                        center: Text(
                                            "00:${(30 - percent * 30).ceil()}"),
                                        progressColor: const Color.fromARGB(
                                            255, 208, 49, 25),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Column(
                                      children: [
                                        Text(
                                          'Rest',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '0:30',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 133, 130, 130)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Workout',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '3 Exercises .',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 133, 130, 130)),
                                  ),
                                  Text(
                                    '2 Minutes',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 133, 130, 130)),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              for (final exercise in exercises.skip(2).take(3))
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget.image = exercise.image;
                                      widget.name = exercise.name;
                                      widget.description = exercise.description;
                                    });
                                    _scrollController.animateTo(
                                      0.0,
                                      duration: const Duration(
                                          milliseconds:
                                              500), // You can adjust the duration as needed
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 15),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 231, 227, 227),
                                        width: 1.0, // Border width
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          12.0), // Optional: for rounded corners
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 5, 10, 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 50,
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 10, 10, 10),
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          exercise.image),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    exercise.name,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    exercise.time,
                                                    style: const TextStyle(
                                                        fontSize: 13,
                                                        color: Color.fromARGB(
                                                            255,
                                                            133,
                                                            130,
                                                            130)),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          SvgPicture.asset(
                                            exercise.iconImage,
                                            // You can customize width, height, color, etc.
                                            width: 20,
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: _restartTimer,
                                        child: CircularPercentIndicator(
                                          radius: 30.0,
                                          lineWidth: 5.0,
                                          percent: percent,
                                          center: Text(
                                              "00:${(30 - percent * 30).ceil()}"),
                                          progressColor: const Color.fromARGB(
                                              255, 208, 49, 25),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Column(
                                        children: [
                                          Text(
                                            'Rest',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '0:30',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 133, 130, 130)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Stretching',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '3 Exercises .',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 133, 130, 130)),
                                  ),
                                  Text(
                                    '2 Minutes',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 133, 130, 130)),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              for (final exercise in exercises.skip(5).take(2))
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget.image = exercise.image;
                                      widget.name = exercise.name;
                                      widget.description = exercise.description;
                                    });
                                    _scrollController.animateTo(
                                      0.0,
                                      duration: const Duration(
                                          milliseconds:
                                              500), // You can adjust the duration as needed
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 15),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 231, 227, 227),
                                        width: 1.0, // Border width
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          12.0), // Optional: for rounded corners
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 5, 10, 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 50,
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 10, 10, 10),
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          exercise.image),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    exercise.name,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    exercise.time,
                                                    style: const TextStyle(
                                                        fontSize: 13,
                                                        color: Color.fromARGB(
                                                            255,
                                                            133,
                                                            130,
                                                            130)),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          SvgPicture.asset(
                                            exercise.iconImage,
                                            // You can customize width, height, color, etc.
                                            width: 20,
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              Card(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: _restartTimer,
                                      child: CircularPercentIndicator(
                                        radius: 30.0,
                                        lineWidth: 5.0,
                                        percent: percent,
                                        center: Text(
                                            "00:${(30 - percent * 30).ceil()}"),
                                        progressColor: const Color.fromARGB(
                                            255, 208, 49, 25),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Column(
                                      children: [
                                        Text(
                                          'Rest',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '0:30',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 133, 130, 130)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor:
                                        const Color.fromARGB(255, 208, 49, 25),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 20),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: const BorderSide(
                                        color: Color.fromARGB(
                                            255, 208, 49, 25), // Outline color
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    'Close',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PracticeScreen(
                                        currentIndex: 0,
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 208, 49, 25),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  'Get Started',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
