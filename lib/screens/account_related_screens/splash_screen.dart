import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/model/user.dart';
import 'package:fitnessapp/screens/tab_related_screens/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash> {
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
    _navigateHome();
  }

  Future<void> _loadUserData() async {
    var user = FirebaseAuth.instance.currentUser!;
    var userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    // Check if the widget is mounted before updating the state
    if (mounted) {
      setState(() {
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
          phone: _phone,
        );
      });
    }
  }

  void _navigateHome() async {
    await Future.delayed(const Duration(seconds: 2), () {
      // Check if the widget is mounted before navigating
      if (mounted) {
        if (userDatas != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TabScreen(
                currentUser: userDatas!,
              ),
            ),
          );
        } else {
          FirebaseAuth.instance.signOut();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MyApp(),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: SpinKitCubeGrid(
        size: 60,
        color: Color.fromARGB(255, 208, 49, 25),
      ),
    ));
  }
}
