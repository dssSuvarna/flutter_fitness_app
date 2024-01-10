import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/provider/user_provider.dart';
import 'package:fitnessapp/screens/account_related_screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final _fireBase = FirebaseAuth.instance;
var uuid = const Uuid();

class InterestsScreen extends ConsumerStatefulWidget {
  const InterestsScreen({super.key});

  @override
  ConsumerState<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends ConsumerState<InterestsScreen> {
  bool oneClicked = false;
  bool twoClicked = false;
  bool threeClicked = false;
  bool fourClicked = false;
  bool fiveClicked = false;
  bool _signUp = false;

  void _showErrorFlushbar(
          IconData icon, title, String errorMessage, Color color) =>
      {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(
                    20.0), // Set the border radius as needed
              ),
              padding: const EdgeInsets.all(3.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        icon,
                        color: Colors.white,
                        size: 30,
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(errorMessage),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            backgroundColor: color,
            behavior: SnackBarBehavior.floating,
            width: 290,
            shape: RoundedRectangleBorder(
              // Set a custom shape
              borderRadius: BorderRadius.circular(20.0),
            ),
            duration: const Duration(milliseconds: 600),
          ),
        )
      };

  void _createAccount() async {
    try {
      final userData = ref.read(userProvider);
      final userKey = uuid.v4();
      final userCredential = await _fireBase.createUserWithEmailAndPassword(
        email: userData.email!,
        password: userData.password!,
      );
      // showDialog(
      //   context: context,
      //   builder: (context) {
      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // );
      setState(() {
        _signUp = true;
      });

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(
        {
          'email': userData.email,
          'userKey': userKey,
          'fullName': userData.fullName,
          'gender': userData.gender ?? 'null',
          'phone': userData.phone,
          'height': userData.height ?? '--',
          'weight': userData.weight ?? '--',
          'goal': userData.goal ?? 'null',
          'dob': userData.dob,
          'interest': userData.interest ?? 'null',
          'trainingLevel': userData.trainingLevel ?? 'Beginner',
          'createdAt': DateTime.now(),
          'updatedAt': DateTime.now(),
        },
      );
      // Navigator.of(context).pop();

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Splash(),
        ),
      );
    } on FirebaseAuthException catch (error) {
      // Navigator.of(context).pop();
      _showErrorFlushbar(Icons.error, 'ERROR',
          error.message ?? 'Authentication-failed', Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Step 6 of 6',
          style:
              TextStyle(color: Color.fromARGB(255, 208, 49, 25), fontSize: 15),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              ref.read(userProvider.notifier).setInterest('null');
              _createAccount();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Choose activities that interest you',
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
                        fiveClicked = false;
                        ref.read(userProvider.notifier).setInterest('Cardio');
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
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent,
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/img_group23.png'),
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text(
                                  'Cardio',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            oneClicked
                                ? const Icon(
                                    Icons.check_circle_rounded,
                                    color: Colors.red,
                                  )
                                : const Icon(Icons.circle_outlined)
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
                        fiveClicked = false;
                        ref
                            .read(userProvider.notifier)
                            .setInterest('Power training');
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
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/img_icon_53X53.png'),
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text('Power training',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ],
                            ),
                            twoClicked
                                ? const Icon(
                                    Icons.check_circle_rounded,
                                    color: Colors.red,
                                  )
                                : const Icon(Icons.circle_outlined)
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
                        fiveClicked = false;
                        ref.read(userProvider.notifier).setInterest('Stretch');
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
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  decoration: BoxDecoration(
                                    color: Colors.yellowAccent,
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/img_icon_1.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text('Stretch',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ],
                            ),
                            threeClicked
                                ? const Icon(
                                    Icons.check_circle_rounded,
                                    color: Colors.red,
                                  )
                                : const Icon(Icons.circle_outlined)
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
                        fiveClicked = false;
                        ref.read(userProvider.notifier).setInterest('Dancing');
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
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/activity4.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text('Dancing',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ],
                            ),
                            fourClicked
                                ? const Icon(
                                    Icons.check_circle_rounded,
                                    color: Colors.red,
                                  )
                                : const Icon(Icons.circle_outlined)
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
                        fourClicked = false;
                        fiveClicked = true;
                        ref.read(userProvider.notifier).setInterest('Yoga');
                      });
                    },
                    child: Container(
                      height: 80,
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: fiveClicked
                              ? Colors.red
                              : const Color.fromARGB(255, 231, 227, 227),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/img_icon_2.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text('Yoga',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ],
                            ),
                            fiveClicked
                                ? const Icon(
                                    Icons.check_circle_rounded,
                                    color: Colors.red,
                                  )
                                : const Icon(Icons.circle_outlined)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  _createAccount();
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
                child: _signUp
                    ? const SizedBox(
                        width:
                            25.0, // You can adjust this value to change the width
                        height:
                            25.0, // You can adjust this value to change the height
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'Continue',
                        textAlign: TextAlign.center,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
