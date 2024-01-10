import 'package:fitnessapp/provider/user_provider.dart';
import 'package:fitnessapp/screens/account_related_screens/height_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoalScreen extends ConsumerStatefulWidget {
  const GoalScreen({super.key});

  @override
  ConsumerState<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends ConsumerState<GoalScreen> {
  bool oneClicked = false;
  bool twoClicked = false;
  bool threeClicked = false;
  bool fourClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Step 2 of 6',
          style:
              TextStyle(color: Color.fromARGB(255, 208, 49, 25), fontSize: 15),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              ref.read(userProvider.notifier).setGoal('null');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HeightScreen(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Text(
                'Skip',
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Column(
                children: [
                  const Text(
                    'Choose main goal',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        oneClicked = true;
                        twoClicked = false;
                        threeClicked = false;
                        fourClicked = false;
                        ref.read(userProvider.notifier).setGoal('Lose weight');
                      });
                    },
                    child: Container(
                      height: 80,
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: oneClicked
                              ? Colors.red
                              : const Color.fromARGB(255, 231, 227, 227),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/goal1.png'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              'Lose weight',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        oneClicked = false;
                        twoClicked = true;
                        threeClicked = false;
                        fourClicked = false;
                        ref.read(userProvider.notifier).setGoal('Keep fit');
                      });
                    },
                    child: Container(
                      height: 80,
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: twoClicked
                              ? Colors.red
                              : const Color.fromARGB(255, 231, 227, 227),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/goal2.png'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              'Keep fit',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        oneClicked = false;
                        twoClicked = false;
                        threeClicked = true;
                        fourClicked = false;
                        ref.read(userProvider.notifier).setGoal('Get stronger');
                      });
                    },
                    child: Container(
                      height: 100,
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: threeClicked
                              ? Colors.red
                              : const Color.fromARGB(255, 231, 227, 227),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/goal3.png'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              'Get stronger',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        oneClicked = false;
                        twoClicked = false;
                        threeClicked = false;
                        fourClicked = true;
                        ref
                            .read(userProvider.notifier)
                            .setGoal('Gain muscle mass');
                      });
                    },
                    child: Container(
                      height: 80,
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: fourClicked
                              ? Colors.red
                              : const Color.fromARGB(255, 231, 227, 227),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/goal4.png'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              'Gain muscle mass',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HeightScreen(),
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
                'Continue',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
