import 'package:fitnessapp/data/training_data.dart';
import 'package:fitnessapp/model/GetItUserData.dart';
import 'package:fitnessapp/screens/training_related_screens/create_workout_screen.dart';
import 'package:fitnessapp/screens/training_related_screens/training_grid_items.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIns = GetIt.instance;

class PersonalTrainingScreen extends StatefulWidget {
  const PersonalTrainingScreen({Key? key}) : super(key: key);

  @override
  State<PersonalTrainingScreen> createState() => _PersonalTrainingScreenState();
}

class _PersonalTrainingScreenState extends State<PersonalTrainingScreen> {
  String groupName = 'Beginner';

  void _selectTraining(BuildContext context, Training training) {}

  @override
  Widget build(BuildContext context) {
    List<Training> sortedTrainingList =
        getIns<GetItUserData>().loadTrainingData(groupName);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal Trainings',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateWorkOut(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: Text(
                'Create',
                style: TextStyle(color: Color.fromARGB(255, 208, 49, 25)),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final group in trainingGrps)
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
            sortedTrainingList.isNotEmpty
                ? Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: sortedTrainingList.length,
                      itemBuilder: (context, index) {
                        final training = sortedTrainingList[index];
                        return TrainingGridItems(
                          tarining: training,
                          level: groupName,
                          selectTraining: () {
                            _selectTraining(context, training);
                          },
                        );
                      },
                    ),
                  )
                : const Center(
                    child: Text('No data found'),
                  ),
          ],
        ),
      ),
    );
  }
}
