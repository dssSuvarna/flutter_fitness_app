import 'package:fitnessapp/data/category_data.dart';
import 'package:fitnessapp/data/training_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrainingFilterScreen extends StatefulWidget {
  const TrainingFilterScreen({super.key});

  @override
  State<TrainingFilterScreen> createState() => _TrainingFilterScreenState();
}

class _TrainingFilterScreenState extends State<TrainingFilterScreen> {
  String _currentCategory = 'Yoga';
  String _currentSubscription = 'Free';
  String _currentLevel = 'Beginner';
  String _currentDuration = '15-20 min';
  String _currentEquipment = 'Dumbles';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Filters',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SvgPicture.asset(
                  'assets/images/img_close_12X12.svg',
                  width: 15,
                  height: 15,
                  alignment: Alignment.centerRight,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Category',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final category in categories)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentCategory = category.name;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: _currentCategory == category.name
                            ? const Color.fromARGB(255, 208, 49, 25)
                            : Colors.white,
                        border: _currentCategory == category.name
                            ? null
                            : Border.all(
                                color: const Color.fromARGB(
                                    255, 184, 184, 184), // Border color
                                width: 1.0, // Border width
                              ),
                        borderRadius: BorderRadius.circular(
                            20.0), // Optional: for rounded corners
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                        child: _currentCategory == category.name
                            ? Text(
                                category.name,
                                style: const TextStyle(color: Colors.white),
                              )
                            : Text(
                                category.name,
                              ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Price',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (final type in subscriptionTypes)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentSubscription = type;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            color: _currentSubscription == type
                                ? const Color.fromARGB(255, 208, 49, 25)
                                : Colors.white,
                            border: _currentSubscription == type
                                ? null
                                : Border.all(
                                    color: const Color.fromARGB(
                                        255, 184, 184, 184), // Border color
                                    width: 1.0, // Border width
                                  ),
                            borderRadius: BorderRadius.circular(
                                20.0), // Optional: for rounded corners
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                            child: _currentSubscription == type
                                ? Text(
                                    type,
                                    style: const TextStyle(color: Colors.white),
                                  )
                                : Text(
                                    type,
                                  ),
                          ),
                        ),
                      ),
                  ],
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
                'Level',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (final group in trainingGrps)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentLevel = group;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            color: _currentLevel == group
                                ? const Color.fromARGB(255, 208, 49, 25)
                                : Colors.white,
                            border: _currentLevel == group
                                ? null
                                : Border.all(
                                    color: const Color.fromARGB(
                                        255, 184, 184, 184), // Border color
                                    width: 1.0, // Border width
                                  ),
                            borderRadius: BorderRadius.circular(
                                20.0), // Optional: for rounded corners
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                            child: _currentLevel == group
                                ? Text(
                                    group,
                                    style: const TextStyle(color: Colors.white),
                                  )
                                : Text(
                                    group,
                                  ),
                          ),
                        ),
                      ),
                  ],
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
                'Duration',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (final time in timeDurations)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentDuration = time;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            color: _currentDuration == time
                                ? const Color.fromARGB(255, 208, 49, 25)
                                : Colors.white,
                            border: _currentDuration == time
                                ? null
                                : Border.all(
                                    color: const Color.fromARGB(
                                        255, 184, 184, 184), // Border color
                                    width: 1.0, // Border width
                                  ),
                            borderRadius: BorderRadius.circular(
                                20.0), // Optional: for rounded corners
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                            child: _currentDuration == time
                                ? Text(
                                    time,
                                    style: const TextStyle(color: Colors.white),
                                  )
                                : Text(
                                    time,
                                  ),
                          ),
                        ),
                      ),
                  ],
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
                'Equipment',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (final equipment in equipments)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentEquipment = equipment;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            color: _currentEquipment == equipment
                                ? const Color.fromARGB(255, 208, 49, 25)
                                : Colors.white,
                            border: _currentEquipment == equipment
                                ? null
                                : Border.all(
                                    color: const Color.fromARGB(
                                        255, 184, 184, 184), // Border color
                                    width: 1.0, // Border width
                                  ),
                            borderRadius: BorderRadius.circular(
                                20.0), // Optional: for rounded corners
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                            child: _currentEquipment == equipment
                                ? Text(
                                    equipment,
                                    style: const TextStyle(color: Colors.white),
                                  )
                                : Text(
                                    equipment,
                                  ),
                          ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color.fromARGB(255, 208, 49, 25),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(
                        color:
                            Color.fromARGB(255, 208, 49, 25), // Outline color
                      ),
                    ),
                  ),
                  child: const Text(
                    'Reset',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 208, 49, 25),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
