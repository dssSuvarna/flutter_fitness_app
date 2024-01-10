import 'package:fitnessapp/provider/user_provider.dart';
import 'package:fitnessapp/screens/account_related_screens/goal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenderScreen extends ConsumerStatefulWidget {
  const GenderScreen({super.key});

  @override
  ConsumerState<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends ConsumerState<GenderScreen> {
  bool maleClicked = false;
  bool femaleClicked = false;
  bool neutralClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Step 1 of 6',
          style:
              TextStyle(color: Color.fromARGB(255, 208, 49, 25), fontSize: 15),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              ref.read(userProvider.notifier).setGender('null');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GoalScreen(),
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
                    'Choose gender',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        femaleClicked = true;
                        maleClicked = false;
                        neutralClicked = false;
                        ref.read(userProvider.notifier).setGender('Woman');
                      });
                    },
                    child: Container(
                      height: 80,
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: femaleClicked
                              ? Colors.red
                              : const Color.fromARGB(255, 231, 227, 227),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Row(
                          children: [
                            Text(
                              '👩',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Woman',
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
                        maleClicked = true;
                        femaleClicked = false;
                        neutralClicked = false;
                        ref.read(userProvider.notifier).setGender('Man');
                      });
                    },
                    child: Container(
                      height: 80,
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: maleClicked
                              ? Colors.red
                              : const Color.fromARGB(255, 231, 227, 227),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Row(
                          children: [
                            Text('👨‍🦰', style: TextStyle(fontSize: 20)),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Man',
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
                        neutralClicked = true;
                        maleClicked = false;
                        femaleClicked = false;
                        ref.read(userProvider.notifier).setGender('neutral');
                      });
                    },
                    child: Container(
                      height: 80,
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: neutralClicked
                              ? Colors.red
                              : const Color.fromARGB(255, 231, 227, 227),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Row(
                          children: [
                            Text('👫', style: TextStyle(fontSize: 20)),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Gender neutral',
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
                    builder: (context) => const GoalScreen(),
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
