import 'package:fitnessapp/data/training_data.dart';
import 'package:fitnessapp/model/GetItUserData.dart';
import 'package:fitnessapp/screens/home_related_screens/popular_workout_grid_items.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIns = GetIt.instance;

class PopularWorkoutsDisplayScreen extends StatefulWidget {
  const PopularWorkoutsDisplayScreen({Key? key}) : super(key: key);

  @override
  State<PopularWorkoutsDisplayScreen> createState() =>
      _PopularWorkoutsDisplayScreenState();
}

class _PopularWorkoutsDisplayScreenState
    extends State<PopularWorkoutsDisplayScreen> {
  String groupName = 'Beginner';

  void _selectTraining(BuildContext context, PopularWorkouts workOut) {}

  @override
  Widget build(BuildContext context) {
    List<PopularWorkouts> sortedWorkOutsList =
        getIns<GetItUserData>().loadPopularWorkOutData(groupName);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Popular Workouts',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
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
            sortedWorkOutsList.isNotEmpty
                ? Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: sortedWorkOutsList.length,
                      itemBuilder: (context, index) {
                        final workouts = sortedWorkOutsList[index];
                        return PopularWorkOutsGridItems(
                          workout: workouts,
                          level: groupName,
                          selectTraining: () {
                            _selectTraining(context, workouts);
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
