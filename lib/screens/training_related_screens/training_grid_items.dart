import 'package:fitnessapp/data/training_data.dart';
import 'package:fitnessapp/provider/training_favorite_provider.dart';
import 'package:fitnessapp/screens/home_related_screens/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrainingGridItems extends ConsumerStatefulWidget {
  const TrainingGridItems({
    Key? key,
    required this.tarining,
    required this.selectTraining,
    required this.level,
  }) : super(key: key);

  final Training tarining;
  final String level;
  final void Function() selectTraining;

  @override
  ConsumerState<TrainingGridItems> createState() => _TrainingGridItemsState();
}

class _TrainingGridItemsState extends ConsumerState<TrainingGridItems> {
  List<Training> favoriteTrainings = [];

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    favoriteTrainings = ref.read(trainingFavoriteProvider);

    return isPortrait
        ? GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WorkOutScreen(
                    image: widget.tarining.image!,
                    name: widget.tarining.name!,
                    description: widget.tarining.discription,
                  ),
                ),
              );
            },
            child: Stack(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 7,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.tarining.image!),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        widget.tarining.name!,
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
                            widget.tarining.time!,
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
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      ref
                          .read(trainingFavoriteProvider.notifier)
                          .toggleMealFavoriteStatus(widget.tarining);
                    });
                  },
                  child: favoriteTrainings.isNotEmpty
                      ? SvgPicture.asset(
                          favoriteTrainings.contains(widget.tarining)
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
            ]),
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
                        image: AssetImage(widget.tarining.image!),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    widget.tarining.name!,
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
                        widget.tarining.time!,
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
