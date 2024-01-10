import 'package:fitnessapp/data/training_data.dart';
import 'package:fitnessapp/provider/training_favorite_provider.dart';
import 'package:fitnessapp/provider/workout_favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

final formattedDate = DateFormat("MMM dd, yyyy").format(DateTime.now());

class MyWorkOutsScreen extends ConsumerStatefulWidget {
  const MyWorkOutsScreen({super.key});

  @override
  ConsumerState<MyWorkOutsScreen> createState() => _MyWorkOutsScreenState();
}

class _MyWorkOutsScreenState extends ConsumerState<MyWorkOutsScreen> {
  bool historyClicked = true;
  bool lastClicked = false;
  bool favClicked = false;
  List<Training> favoriteTrainings = [];
  List<PopularWorkouts> favoriteWorkouts = [];

  @override
  void initState() {
    super.initState();
    favoriteTrainings = ref.read(trainingFavoriteProvider);
    favoriteWorkouts = ref.read(workoutFavoriteProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My workouts',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        15.0), // Adjust the value as needed
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                historyClicked = true;
                                lastClicked = false;
                                favClicked = false;
                              });
                            },
                            child: Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              decoration: historyClicked
                                  ? BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 208, 49, 25),
                                      borderRadius: BorderRadius.circular(15.0),
                                    )
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                              child: historyClicked
                                  ? const Text(
                                      'History',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    )
                                  : const Text(
                                      'History',
                                      textAlign: TextAlign.center,
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                historyClicked = false;
                                lastClicked = true;
                                favClicked = false;
                              });
                            },
                            child: Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              decoration: lastClicked
                                  ? BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 208, 49, 25),
                                      borderRadius: BorderRadius.circular(15.0),
                                    )
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                              child: lastClicked
                                  ? const Text(
                                      'Last',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    )
                                  : const Text(
                                      'Last',
                                      textAlign: TextAlign.center,
                                    ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                historyClicked = false;
                                lastClicked = false;
                                favClicked = true;
                              });
                            },
                            child: Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              decoration: favClicked
                                  ? BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 208, 49, 25),
                                      borderRadius: BorderRadius.circular(15.0),
                                    )
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                              child: favClicked
                                  ? const Text(
                                      'Favorites',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    )
                                  : const Text(
                                      'Favorites',
                                      textAlign: TextAlign.center,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (favClicked)
                if (favoriteTrainings.isNotEmpty)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formattedDate,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 133, 130, 130)),
                          ),
                          Text(
                            '${favoriteTrainings.length} workout, 32 minutes',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 133, 130, 130)),
                          )
                        ],
                      ),
                      for (final favTraining in favoriteTrainings)
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Card(
                              margin: const EdgeInsets.only(bottom: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
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
                                          height: 65,
                                          width: 80,
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 10, 10, 10),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  favTraining.image.toString()),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
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
                                              favTraining.name.toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text(
                                              '08:30 - 10:15',
                                              style: TextStyle(
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
                                      onTap: () {},
                                      child: SvgPicture.asset(
                                        'assets/images/img_checkmark.svg',
                                        width: 15,
                                        height: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
              if (favClicked)
                if (favoriteWorkouts.isNotEmpty)
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formattedDate,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 133, 130, 130)),
                          ),
                          Text(
                            '${favoriteWorkouts.length} workout, 55 minutes',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 133, 130, 130)),
                          )
                        ],
                      ),
                      for (final favWorkout in favoriteWorkouts)
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Card(
                              margin: const EdgeInsets.only(bottom: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              12,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 10, 10, 10),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  favWorkout.image.toString()),
                                              fit: BoxFit.fill,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
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
                                              favWorkout.name.toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text(
                                              '10:30 - 11:15',
                                              style: TextStyle(
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
                                      onTap: () {},
                                      child: SvgPicture.asset(
                                        'assets/images/img_checkmark.svg',
                                        width: 15,
                                        height: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
              if (historyClicked || lastClicked)
                Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              formattedDate,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 133, 130, 130)),
                            ),
                            const Text(
                              '1 workout, 32 minutes',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 133, 130, 130)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          margin: const EdgeInsets.only(bottom: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15.0), // Adjust the value as needed
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
                                          MediaQuery.of(context).size.height /
                                              12,
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/img_7xm25.png'),
                                            fit: BoxFit.fill),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Full Body Yoga',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '08:30 - 09:15',
                                          style: TextStyle(
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
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    'assets/images/img_checkmark.svg',
                                    // You can customize width, height, color, etc.
                                    width: 15,
                                    height: 15,
                                  ),
                                ),
                              ],
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              formattedDate,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 133, 130, 130)),
                            ),
                            const Text(
                              '1 workout, 55 minutes',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 133, 130, 130)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          margin: const EdgeInsets.only(bottom: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15.0), // Adjust the value as needed
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
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/img_7xm43.png'),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Full Body Fast',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '09:20 - 10:15',
                                          style: TextStyle(
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
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    'assets/images/img_checkmark.svg',
                                    // You can customize width, height, color, etc.
                                    width: 15,
                                    height: 15,
                                  ),
                                ),
                              ],
                            ),
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
    );
  }
}
