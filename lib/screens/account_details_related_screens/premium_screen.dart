import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/model/user.dart';
import 'package:fitnessapp/screens/tab_related_screens/tab_screen.dart';
import 'package:flutter/material.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key, required this.currentUser});
  final UserData currentUser;

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  bool _monthlyClicked = false;
  bool _yearlyClicked = false;
  String? _trainingLevel;
  String? _height;
  String? _weight;
  String? _fullName;
  String? _dob;
  String? _email;
  String? _gender;
  String? _goal;
  String? _interest;
  String? _phone;
  UserData? userDatas;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    var user = FirebaseAuth.instance.currentUser!;
    var userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    _trainingLevel = userData.data()!['trainingLevel'];
    _height = userData.data()!['height'];
    _weight = userData.data()!['weight'];
    _fullName = userData.data()!['fullName'];
    _dob = userData.data()!['dob'];
    _email = userData.data()!['email'];
    _gender = userData.data()!['gender'];
    _goal = userData.data()!['goal'];
    _interest = userData.data()!['interest'];
    _phone = userData.data()!['phone'];

    userDatas = UserData(
        trainingLevel: _trainingLevel,
        height: _height,
        weight: _weight,
        fullName: _fullName,
        dob: _dob,
        email: _email,
        gender: _gender,
        goal: _goal,
        interest: _interest,
        phone: _phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 208, 49, 25),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width / 45,
                  // ),
                  Image.asset(
                    'assets/images/img_7xm5.png',
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Millions of Users choice',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'We believe that our app should inspire you to be the best version of yourself',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle_rounded,
                                  color: Color.fromARGB(255, 208, 49, 25),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Professional videos with coatches')
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle_rounded,
                                  color: Color.fromARGB(255, 208, 49, 25),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Over 100 ready-made workouts')
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle_rounded,
                                  color: Color.fromARGB(255, 208, 49, 25),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Create your personal training plan')
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle_rounded,
                                  color: Color.fromARGB(255, 208, 49, 25),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Without advertising')
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _yearlyClicked = false;
                                  _monthlyClicked = true;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _monthlyClicked
                                        ? const Color.fromARGB(255, 208, 49, 25)
                                        : const Color.fromARGB(
                                            255, 231, 227, 227), // Border color
                                    width: 1.0, // Border width
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      12.0), // Optional: for rounded corners
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Monthly',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 208, 49, 25),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '\$5,99',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 208, 49, 25),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        'per month',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                255, 133, 130, 130)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _yearlyClicked = true;
                                  _monthlyClicked = false;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _yearlyClicked
                                        ? const Color.fromARGB(255, 208, 49, 25)
                                        : const Color.fromARGB(
                                            255, 231, 227, 227), // Border color
                                    width: 1.0, // Border width
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      12.0), // Optional: for rounded corners
                                ),
                                child: const Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Yearly',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 208, 49, 25),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '\$39,99',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 208, 49, 25),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          'per year',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 133, 130, 130)),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Future.delayed(const Duration(milliseconds: 1), () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TabScreen(
                                  currentUser: userDatas!,
                                  isPremium: true,
                                ),
                              ),
                            );
                          });
                          // Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 208, 49, 25),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
