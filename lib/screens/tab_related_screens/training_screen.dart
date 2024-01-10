import 'package:fitnessapp/model/GetItUserData.dart';
import 'package:fitnessapp/screens/training_related_screens/personal_training_screen.dart';
import 'package:fitnessapp/screens/training_related_screens/training_filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/data/training_data.dart';
import 'package:fitnessapp/screens/training_related_screens/training_grid_items.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({Key? key, required this.userTrainingLevel})
      : super(key: key);
  final String userTrainingLevel;

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  List<Training> sortedTrainingList = [];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animationController.forward();
    sortedTrainingList =
        getIns<GetItUserData>().loadTrainingData(widget.userTrainingLevel);
  }

  void _displayInformation() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const TrainingFilterScreen(),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectTraining(BuildContext context, Training training) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Trainings',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  GestureDetector(
                    onTap: () {
                      _displayInformation();
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
                          'assets/images/img_minimize.svg',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
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
                      width: 1.0,
                      color: Color.fromARGB(255, 208, 49, 25),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, -0.5),
                  end: const Offset(0, 0),
                ).animate(
                  CurvedAnimation(
                    parent: _animationController,
                    curve: Curves.bounceOut,
                  ),
                ),
                child: Material(
                  // Wrap the Container with Material to enable ink splash animation
                  color: Colors.transparent,
                  child: Ink(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 235, 134, 167),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () {
                        Future.delayed(const Duration(milliseconds: 1), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PersonalTrainingScreen(),
                            ),
                          );
                        });
                      },
                      splashColor:
                          Colors.pinkAccent, // Customize the splash color
                      highlightColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Create Personal',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Training',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 6,
                              child: Image.asset(
                                'assets/images/img_7xm20.png',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              sortedTrainingList.isNotEmpty
                  ? Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: sortedTrainingList.length,
                        itemBuilder: (context, index) {
                          final training = trainingLists[index];
                          return TrainingGridItems(
                            tarining: training,
                            level: widget.userTrainingLevel,
                            selectTraining: () {
                              _selectTraining(context, training);
                            },
                          );
                        },
                      ),
                    )
                  : const Center(
                      child: Text('No tainings found'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
