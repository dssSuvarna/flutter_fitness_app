import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkOutReminderScreen extends StatefulWidget {
  const WorkOutReminderScreen({super.key});

  @override
  State<WorkOutReminderScreen> createState() => _WorkOutReminderScreenState();
}

class _WorkOutReminderScreenState extends State<WorkOutReminderScreen>
    with SingleTickerProviderStateMixin {
  bool _sundayClicked = false;
  bool _mondayClicked = false;
  bool _tuesdayClicked = false;
  bool _wednesdayClicked = false;
  bool _thursdayClicked = false;
  bool _fridayClicked = false;
  bool _saturdayClicked = false;
  DateTime? _selectedTime;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Workout reminders',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(15, 100, 15, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Select the days you want to exercise',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, -0.6),
                      end: const Offset(0, 0.2),
                    ).animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Curves.bounceOut,
                      ),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _saturdayClicked = true;
                                _sundayClicked = false;
                                _mondayClicked = false;
                                _tuesdayClicked = false;
                                _wednesdayClicked = false;
                                _thursdayClicked = false;
                                _fridayClicked = false;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              child: CircleAvatar(
                                backgroundColor: _saturdayClicked
                                    ? const Color.fromARGB(255, 208, 49, 25)
                                    : const Color.fromARGB(255, 184, 184, 184),
                                radius: 20, // Adjust the radius as needed
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'S',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _saturdayClicked = false;
                                _sundayClicked = true;
                                _mondayClicked = false;
                                _tuesdayClicked = false;
                                _wednesdayClicked = false;
                                _thursdayClicked = false;
                                _fridayClicked = false;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: CircleAvatar(
                                backgroundColor: _sundayClicked
                                    ? const Color.fromARGB(255, 208, 49, 25)
                                    : const Color.fromARGB(255, 184, 184, 184),
                                radius: 20, // Adjust the radius as needed
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'S',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _saturdayClicked = false;
                                _sundayClicked = false;
                                _mondayClicked = true;
                                _tuesdayClicked = false;
                                _wednesdayClicked = false;
                                _thursdayClicked = false;
                                _fridayClicked = false;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: CircleAvatar(
                                backgroundColor: _mondayClicked
                                    ? const Color.fromARGB(255, 208, 49, 25)
                                    : const Color.fromARGB(255, 184, 184, 184),
                                radius: 20, // Adjust the radius as needed
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'M',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _saturdayClicked = false;
                                _sundayClicked = false;
                                _mondayClicked = false;
                                _tuesdayClicked = true;
                                _wednesdayClicked = false;
                                _thursdayClicked = false;
                                _fridayClicked = false;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: CircleAvatar(
                                backgroundColor: _tuesdayClicked
                                    ? const Color.fromARGB(255, 208, 49, 25)
                                    : const Color.fromARGB(255, 184, 184, 184),
                                radius: 20, // Adjust the radius as needed
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'T',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _saturdayClicked = false;
                                _sundayClicked = false;
                                _mondayClicked = false;
                                _tuesdayClicked = false;
                                _wednesdayClicked = true;
                                _thursdayClicked = false;
                                _fridayClicked = false;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: CircleAvatar(
                                backgroundColor: _wednesdayClicked
                                    ? const Color.fromARGB(255, 208, 49, 25)
                                    : const Color.fromARGB(255, 184, 184, 184),
                                radius: 20, // Adjust the radius as needed
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'W',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _saturdayClicked = false;
                                _sundayClicked = false;
                                _mondayClicked = false;
                                _tuesdayClicked = false;
                                _wednesdayClicked = false;
                                _thursdayClicked = true;
                                _fridayClicked = false;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: CircleAvatar(
                                backgroundColor: _thursdayClicked
                                    ? const Color.fromARGB(255, 208, 49, 25)
                                    : const Color.fromARGB(255, 184, 184, 184),
                                radius: 20, // Adjust the radius as needed
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'T',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _saturdayClicked = false;
                                _sundayClicked = false;
                                _mondayClicked = false;
                                _tuesdayClicked = false;
                                _wednesdayClicked = false;
                                _thursdayClicked = false;
                                _fridayClicked = true;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: CircleAvatar(
                                backgroundColor: _fridayClicked
                                    ? const Color.fromARGB(255, 208, 49, 25)
                                    : const Color.fromARGB(255, 184, 184, 184),
                                radius: 20, // Adjust the radius as needed
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'F',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Select the times you want to exercise',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      initialDateTime: _selectedTime,
                      onDateTimeChanged: (time) {
                        setState(() {
                          _selectedTime = time;
                        });
                      },
                    ),
                  )
                ],
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
                  'Create a Reminder',
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
