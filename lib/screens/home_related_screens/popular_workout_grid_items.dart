import 'package:fitnessapp/data/training_data.dart';
import 'package:fitnessapp/screens/home_related_screens/workout_screen.dart';
import 'package:flutter/material.dart';

class PopularWorkOutsGridItems extends StatefulWidget {
  const PopularWorkOutsGridItems({
    Key? key,
    required this.workout,
    required this.selectTraining,
    required this.level,
  }) : super(key: key);

  final PopularWorkouts workout;
  final String level;
  final void Function() selectTraining;

  @override
  State<PopularWorkOutsGridItems> createState() =>
      _PopularWorkOutsGridItemsState();
}

class _PopularWorkOutsGridItemsState extends State<PopularWorkOutsGridItems> {
  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return isPortrait
        ? GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WorkOutScreen(
                    image: widget.workout.image,
                    name: widget.workout.name,
                    description: widget.workout.discription,
                  ),
                ),
              );
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 7,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.workout.image),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      widget.workout.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          widget.level,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 208, 49, 25)),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          '.',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          widget.workout.time,
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 133, 130, 130)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        : SizedBox(
            height: MediaQuery.of(context).size.height / 5,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.workout.image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    widget.workout.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        widget.level,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 208, 49, 25)),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        widget.workout.time,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
