import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/model/user.dart';
import 'package:fitnessapp/screens/account_related_screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SignUpSplash extends StatefulWidget {
  const SignUpSplash({super.key});

  @override
  State<SignUpSplash> createState() => _SignUpSplashState();
}

class _SignUpSplashState extends State<SignUpSplash> {
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

  void _navigateHome() async {
    await Future.delayed(const Duration(seconds: 2), () {
      // Check if the widget is mounted before navigating
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const StartScreen(),
          ),
        );
      }
    });
  }

  Future<void> _loadUserData() async {
    var user = FirebaseAuth.instance.currentUser!;
    try {
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
    } catch (error) {
      // Handle the error appropriately (e.g., log, show error message)
      print("Error loading user data: $error");
    }
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
