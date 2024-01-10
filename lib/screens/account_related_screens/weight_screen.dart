import 'package:fitnessapp/provider/user_provider.dart';
import 'package:fitnessapp/screens/account_related_screens/training_level_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeightScreen extends ConsumerStatefulWidget {
  const WeightScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends ConsumerState<WeightScreen> {
  bool poundClicked = true;
  bool kgClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Step 4 of 6',
          style:
              TextStyle(color: Color.fromARGB(255, 208, 49, 25), fontSize: 15),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              ref.read(userProvider.notifier).setWeight('--');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TrainingLevelScreen(),
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
            Container(
              height: 50,
            ),
            Expanded(
              child: Column(
                children: [
                  const Text(
                    'Select weight',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20.0),
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
                                  poundClicked = true;
                                  kgClicked = false;
                                });
                              },
                              child: Container(
                                height: 40,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                decoration: poundClicked
                                    ? BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      )
                                    : BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                child: poundClicked
                                    ? const Text(
                                        'Pound',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      )
                                    : const Text(
                                        'Pound',
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
                                  kgClicked = true;
                                  poundClicked = false;
                                });
                              },
                              child: Container(
                                height: 40,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                decoration: kgClicked
                                    ? BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      )
                                    : BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                child: kgClicked
                                    ? const Text(
                                        'Kilogram',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      )
                                    : const Text(
                                        'Kilogram',
                                        textAlign: TextAlign.center,
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  poundClicked
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 231, 227, 227),
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  ref
                                      .read(userProvider.notifier)
                                      .setWeight('${value} lb');
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('lb')
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onChanged: (value) {
                                  ref
                                      .read(userProvider.notifier)
                                      .setWeight('${value} kg');
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('kg')
                          ],
                        )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TrainingLevelScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 208, 49, 25),
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
