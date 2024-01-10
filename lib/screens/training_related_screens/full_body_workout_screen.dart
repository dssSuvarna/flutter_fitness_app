import 'package:fitnessapp/data/exercises_data.dart';
import 'package:fitnessapp/screens/home_related_screens/exercise_information.dart';
import 'package:fitnessapp/screens/home_related_screens/practice_screen.dart';
import 'package:fitnessapp/screens/home_related_screens/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FullBodyWorkOutScreen extends StatefulWidget {
  const FullBodyWorkOutScreen({super.key});

  @override
  State<FullBodyWorkOutScreen> createState() => _FullBodyWorkOutScreenState();
}

class _FullBodyWorkOutScreenState extends State<FullBodyWorkOutScreen> {
  bool oneClicked = false;
  bool twoClicked = false;
  bool threeClicked = false;
  bool fourClicked = false;

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Full body workout',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Full body workout',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: SvgPicture.asset(
                        'assets/images/img_edit.svg',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 229, 225, 225),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Column(
                          children: [
                            Text(
                              '12',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Exercises',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 229, 225, 225),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Column(
                          children: [
                            Text(
                              '30:00',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Time',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 229, 225, 225),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Column(
                          children: [
                            Text(
                              '260',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Calorie',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Choose Equipment',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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
                height: 20,
                thickness: 5,
                color: Color.fromARGB(255, 231, 227, 227),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Choose Focus Area',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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
                height: 40,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Warm-up',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Edit',
                    style: TextStyle(color: Color.fromARGB(255, 133, 130, 130)),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  for (final exercise in exercises.take(2))
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WorkOutScreen(
                              image: exercise.image,
                              name: exercise.name,
                              description: exercise.description,
                            ),
                          ),
                        );
                      },
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 12,
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 10, 10, 10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(exercise.image),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(5.0),
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
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        exercise.time,
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Color.fromARGB(
                                                255, 133, 130, 130)),
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
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Workout',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(
                            255, 231, 227, 227), // Border color
                        width: 1.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(
                          12.0), // Optional: for rounded corners
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Text(
                            '💪',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Add Exercises',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Stretching',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Edit',
                    style: TextStyle(color: Color.fromARGB(255, 133, 130, 130)),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  for (final exercise in exercises.skip(2).take(2))
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WorkOutScreen(
                              image: exercise.image,
                              name: exercise.name,
                              description: exercise.description,
                            ),
                          ),
                        );
                      },
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 12,
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 10, 10, 10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(exercise.image),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(5.0),
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
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        exercise.time,
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Color.fromARGB(
                                                255, 133, 130, 130)),
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
                      builder: (context) => const PracticeScreen(
                        currentIndex: 0,
                      ),
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
                  'Save & Start',
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
