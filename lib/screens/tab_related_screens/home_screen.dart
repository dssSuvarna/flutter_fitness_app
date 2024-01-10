import 'package:fitnessapp/data/category_data.dart';
import 'package:fitnessapp/data/exercises_data.dart';
import 'package:fitnessapp/data/training_data.dart';
import 'package:fitnessapp/model/user.dart';
import 'package:fitnessapp/provider/workout_favorite_provider.dart';
import 'package:fitnessapp/screens/home_related_screens/categories_screen.dart';
import 'package:fitnessapp/screens/home_related_screens/exercise_information.dart';
import 'package:fitnessapp/screens/home_related_screens/exercises_screen.dart';
import 'package:fitnessapp/screens/home_related_screens/notification_screen.dart';
import 'package:fitnessapp/screens/home_related_screens/popular_workouts_display.dart';
import 'package:fitnessapp/screens/home_related_screens/practice_screen.dart';
import 'package:fitnessapp/screens/home_related_screens/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key, required this.currentUser});
  final UserData currentUser;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<PopularWorkouts> favoriteWorkOuts = [];
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _animationController.forward();
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
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    favoriteWorkOuts = ref.read(workoutFavoriteProvider);
    return SafeArea(
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi ${widget.currentUser.fullName.toString()[0].toUpperCase() + widget.currentUser.fullName.toString().substring(1)}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationScreen(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 231, 227, 227),
                          ),
                          borderRadius: BorderRadius.circular(
                              10.0), // Optional: for rounded corners
                        ),
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: SvgPicture.asset(
                              'assets/images/img_clock.svg',
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    isDense: true,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 15.0),
                    /* -- Text and Icon -- */
                    hintText: "search something",
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFFB3B1B1),
                    ), // TextStyle
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 26,
                      color: Colors.black54,
                    ), // Icon
                    /* -- Border Styling -- */
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: Color(0xFFFF0000),
                      ), // BorderSide
                    ), // OutlineInputBorder
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: Color.fromARGB(255, 231, 227, 227),
                      ), // BorderSide
                    ), // OutlineInputBorder
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: Color.fromARGB(255, 208, 49, 25),
                      ), // BorderSide
                    ), // OutlineInputBorder
                  ), // InputDecoration
                ),
                const SizedBox(
                  height: 25,
                ),
                SafeArea(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3.6,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 235, 134, 167),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                      child: Row(children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Full Body Toning Workout',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Includes circuits to work every muscle',
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(
                                height: 10,
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
                                      horizontal: 30, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  'Start Training',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 3.6,
                            child: Image.asset(
                              'assets/images/img_7xm7.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Category',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CategoriesScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'view all',
                            style: TextStyle(
                                color: Color.fromARGB(255, 133, 130, 130)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.5),
                          end: const Offset(0, 0),
                        ).animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: Curves.bounceOut,
                          ),
                        ),
                        child: Row(
                          children: [
                            for (final category in categories)
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 231, 227, 227), // Border color
                                      width: 1.0, // Border width
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Optional: for rounded corners
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        13, 18, 13, 18),
                                    child: Column(
                                      children: [
                                        Text(
                                          category.emoji,
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          category.name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Popular Workouts',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PopularWorkoutsDisplayScreen(),
                                fullscreenDialog: true,
                              ),
                            );
                          },
                          child: const Text(
                            'view all',
                            style: TextStyle(
                                color: Color.fromARGB(255, 133, 130, 130)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Workouts: 80',
                      style:
                          TextStyle(color: Color.fromARGB(255, 133, 130, 130)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (final popularWorkOuts in popularWorkoutLists)
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WorkOutScreen(
                                      image: popularWorkOuts.image,
                                      name: popularWorkOuts.name,
                                      description: popularWorkOuts.discription,
                                    ),
                                  ),
                                );
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          10.0), // Optional: for rounded corners
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  popularWorkOuts.image),
                                              fit: BoxFit.fill,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          popularWorkOuts.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              popularWorkOuts.groups.contains(
                                                      widget.currentUser
                                                          .trainingLevel
                                                          .toString())
                                                  ? widget
                                                      .currentUser.trainingLevel
                                                      .toString()
                                                  : 'Beginner',
                                              style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 208, 49, 25),
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text(
                                              '.',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              popularWorkOuts.time,
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 133, 130, 130)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 20,
                                    right: 30,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          ref
                                              .read(workoutFavoriteProvider
                                                  .notifier)
                                              .workoutFavoriteStatus(
                                                  popularWorkOuts);
                                        });
                                      },
                                      child: favoriteWorkOuts.isNotEmpty
                                          ? SvgPicture.asset(
                                              favoriteWorkOuts
                                                      .contains(popularWorkOuts)
                                                  ? 'assets/images/img_favorite.svg'
                                                  : 'assets/images/img_location.svg',
                                              width: 20,
                                              height: 20,
                                            )
                                          : SvgPicture.asset(
                                              'assets/images/img_location.svg',
                                              width: 20,
                                              height: 20,
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Exercises',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ExercisesScreen(),
                                  fullscreenDialog: true),
                            );
                          },
                          child: const Text(
                            'view all',
                            style: TextStyle(
                                color: Color.fromARGB(255, 133, 130, 130)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Exercises: 210',
                      style:
                          TextStyle(color: Color.fromARGB(255, 133, 130, 130)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        for (final exercise in exercises.take(4))
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
                                                image:
                                                    AssetImage(exercise.image),
                                                fit: BoxFit.fill),
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
