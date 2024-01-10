import 'dart:async';

import 'package:fitnessapp/data/body_tonning_workout_data.dart';
import 'package:fitnessapp/screens/tab_related_screens/activity_screen.dart';
import 'package:fitnessapp/screens/home_related_screens/workout_summury_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

final timeFormatter = DateFormat('HH:mm');

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({Key? key, required this.currentIndex})
      : super(key: key);
  final int currentIndex;

  @override
  _PracticeScreenState createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Timer _timer;
  int _start = 30;
  bool _isTimerRunning = true;

  @override
  void initState() {
    super.initState();
    startTimer();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animationController.forward();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _isTimerRunning = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void toggleTimer() {
    setState(() {
      if (_isTimerRunning) {
        _timer.cancel();
      } else {
        _start = 30; // Reset the timer to the initial value
        startTimer();
      }
      _isTimerRunning = !_isTimerRunning;
    });
  }

  void navigateToNextExercise() {
    // _timer.cancel();

    // if (_currentIndex < bodyTonningLists.length - 1) {
    //   setState(() {
    //     _currentIndex++;
    //     _start = 30;
    //     _isTimerRunning = true;
    //     startTimer();
    //   });
    // } else {
    //   print("All exercises completed!");
    // }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkOutSummaryScreen(
          currentIndex: widget.currentIndex,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Exercise ${widget.currentIndex + 1}/${bodyTonningLists.length}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${timeFormatter.format(DateTime.now())}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      bodyTonningLists[widget.currentIndex].image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: <Widget>[
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, -0.4),
                      end: const Offset(0, 0.2),
                    ).animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Curves.bounceOut,
                      ),
                    ),
                    child: Text(
                      '${_start ~/ 60}:${(_start % 60).toString().padLeft(2, '0')}',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    bodyTonningLists[widget.currentIndex].name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  if (widget.currentIndex < bodyTonningLists.length - 1)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Next Exercise',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(
                                    255, 231, 227, 227), // Border color
                                width: 1.0, // Border width
                              ),
                              borderRadius: BorderRadius.circular(
                                  12.0), // Optional: for rounded corners
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                11,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 10, 10, 10),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  bodyTonningLists[
                                                          widget.currentIndex +
                                                              1]
                                                      .image),
                                              fit: BoxFit.fill),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                                            bodyTonningLists[
                                                    widget.currentIndex + 1]
                                                .name,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Text(
                                            '0:30',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Color.fromARGB(
                                                  255, 133, 130, 130),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/img_info.svg',
                                    // You can customize width, height, color, etc.
                                    width: 20,
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            toggleTimer();
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.red),
                          ),
                          child: Text(
                            _isTimerRunning ? "Pause" : "Start",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 208, 49, 25),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (widget.currentIndex >
                                bodyTonningLists.length - 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ActivityScreen(),
                                ),
                              );
                            } else {
                              navigateToNextExercise();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 208, 49, 25),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: const Text(
                            'Finish',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
