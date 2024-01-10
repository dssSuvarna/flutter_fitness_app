import 'package:fitnessapp/data/exercises_data.dart';
import 'package:fitnessapp/screens/home_related_screens/exercise_information.dart';
import 'package:fitnessapp/screens/home_related_screens/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({Key? key}) : super(key: key);

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  String groupName = 'All exercises';

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
          'All exercises',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFFFFFFF),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                hintText: "Search something",
                hintStyle: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFFB3B1B1),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 26,
                  color: Colors.black54,
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
                      width: 1.0, color: Color.fromARGB(255, 231, 227, 227)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final group in exerciseGroups)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          groupName = group;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          color: group == groupName
                              ? const Color.fromARGB(255, 208, 49, 25)
                              : Colors.white,
                          border: Border.all(
                            color: group == groupName
                                ? Colors.white
                                : const Color.fromARGB(255, 231, 227, 227),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Center(
                            child: group == groupName
                                ? Text(
                                    group,
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  )
                                : Text(
                                    group,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (BuildContext context, int index) {
                  final exercise = exercises[index];
                  if (exercise.groups.contains(groupName)) {
                    return GestureDetector(
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
                            color: const Color.fromARGB(255, 231, 227, 227),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 10, 10, 10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(exercise.image),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
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
                                            fontSize: 10,
                                            color: Color.fromARGB(
                                                255, 133, 130, 130)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(width: 5),
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
                                  width: 15,
                                  height: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container(); // Empty container for items you don't want to render
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
