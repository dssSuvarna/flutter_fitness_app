import 'package:fitnessapp/screens/training_related_screens/full_body_workout_screen.dart';
import 'package:flutter/material.dart';

class CreateWorkOut extends StatefulWidget {
  const CreateWorkOut({super.key});

  @override
  State<CreateWorkOut> createState() => _CreateWorkOutState();
}

class _CreateWorkOutState extends State<CreateWorkOut> {
  bool oneClicked = false;
  bool twoClicked = false;
  bool threeClicked = false;
  bool fourClicked = false;
  bool _warmUp = false;
  bool _stretch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Custom Workout',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                  'Log each workout you complete to keep of tour fitness program!'),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFFFFFFF),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(15),
                  hintText: "Workout name",
                  hintStyle: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFFB3B1B1),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Color(0xFFFF0000),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Color.fromARGB(255, 231, 227, 227),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Color.fromARGB(255, 208, 49, 25),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Choose Level'),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    oneClicked = true;
                    twoClicked = false;
                    threeClicked = false;
                    fourClicked = false;
                  });
                },
                child: Container(
                  height: 80,
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: oneClicked
                          ? Colors.red
                          : const Color.fromARGB(255, 231, 227, 227),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Beginner',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('i want to start training',
                            style: TextStyle(
                                fontSize: 13,
                                color: Color.fromARGB(255, 133, 130, 130)))
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    oneClicked = false;
                    twoClicked = true;
                    threeClicked = false;
                    fourClicked = false;
                  });
                },
                child: Container(
                  height: 80,
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: twoClicked
                          ? Colors.red
                          : const Color.fromARGB(255, 231, 227, 227),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Irregular taining',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('I train 1-2 times in a week',
                            style: TextStyle(
                                fontSize: 13,
                                color: Color.fromARGB(255, 133, 130, 130)))
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    oneClicked = false;
                    twoClicked = false;
                    threeClicked = true;
                    fourClicked = false;
                  });
                },
                child: Container(
                  height: 80,
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: threeClicked
                          ? Colors.red
                          : const Color.fromARGB(255, 231, 227, 227),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Medium',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('I train 3-5 times in a week',
                            style: TextStyle(
                                fontSize: 13,
                                color: Color.fromARGB(255, 133, 130, 130)))
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    oneClicked = false;
                    twoClicked = false;
                    threeClicked = false;
                    fourClicked = true;
                  });
                },
                child: Container(
                  height: 80,
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: fourClicked
                          ? Colors.red
                          : const Color.fromARGB(255, 231, 227, 227),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Advanced',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('I train more than 5 times a week',
                            style: TextStyle(
                                fontSize: 13,
                                color: Color.fromARGB(255, 133, 130, 130)))
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Choose Equipment'),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            '2 Dunbells, ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 133, 130, 130)),
                          ),
                          Text(
                            'Mat',
                            style: TextStyle(
                                color: Color.fromARGB(255, 133, 130, 130)),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Color.fromARGB(255, 231, 227, 227),
                        size: 15,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Color.fromARGB(255, 231, 227, 227),
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Choose Focus Area'),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Legs, ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 133, 130, 130)),
                          ),
                          Text(
                            'Core muscles',
                            style: TextStyle(
                                color: Color.fromARGB(255, 133, 130, 130)),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Color.fromARGB(255, 231, 227, 227),
                        size: 15,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Color.fromARGB(255, 231, 227, 227),
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Include Warm-Up'),
                  Column(
                    children: [
                      const Text(''), // Empty text to create space
                      Switch(
                        value: _warmUp,
                        activeTrackColor:
                            const Color.fromARGB(255, 208, 49, 25),
                        onChanged: (bool value) {
                          setState(() {
                            _warmUp = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Include Stretching'),
                  Column(
                    children: [
                      const Text(''), // Empty text to create space
                      Switch(
                        value: _stretch,
                        activeTrackColor:
                            const Color.fromARGB(255, 208, 49, 25),
                        onChanged: (bool value) {
                          setState(() {
                            _stretch = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FullBodyWorkOutScreen(),
                    ),
                  );
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
                  'Create Workout',
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
