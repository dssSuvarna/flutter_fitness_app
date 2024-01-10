import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/model/user.dart';
import 'package:fitnessapp/screens/account_details_related_screens/update_account_screen.dart';
import 'package:fitnessapp/screens/account_details_related_screens/my_workouts_screen.dart';
import 'package:fitnessapp/screens/account_details_related_screens/premium_screen.dart';
import 'package:fitnessapp/screens/account_details_related_screens/workout_reminder_screen.dart';
import 'package:flutter/material.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails(
      {super.key, required this.isPremium, required this.currentUser});
  final bool isPremium;
  final UserData currentUser;

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails>
    with SingleTickerProviderStateMixin {
  var age;
  bool _pinLock = false;
  bool _appleHealth = false;
  bool _engClicked = false;
  bool _hindiClicked = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    age = calculateAge(widget.currentUser.dob.toString());
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animationController.forward();
  }

  int calculateAge(String birthDate) {
    DateTime date = DateFormat("MM/dd/yyyy").parse(birthDate);
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - date.year;

    // Adjust age if birthday hasn't occurred yet this year
    if (currentDate.month < date.month ||
        (currentDate.month == date.month && currentDate.day < date.day)) {
      age--;
    }

    return age;
  }

  void _chooseLanguage(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      builder: (cnx) => Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'title'.tr(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'done'.tr(),
                    ),
                  ),
                ],
              ),
              const Divider(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.setLocale(const Locale('en', 'US'));
                      setState(() {
                        _engClicked = true;
                      });
                    },
                    child: Text('english'.tr()),
                  ),
                  const SizedBox(width: 15),
                  _hindiClicked
                      ? const Icon(
                          Icons.done,
                          color: Color.fromARGB(255, 208, 49, 25),
                        )
                      : const Icon(Icons.done),
                ],
              ),
              const Divider(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.setLocale(const Locale('hi', 'IN'));
                      setState(() {
                        _hindiClicked = true;
                      });
                    },
                    child: Text('hindi'.tr()),
                  ),
                  const SizedBox(width: 15),
                  _hindiClicked
                      ? const Icon(
                          Icons.done,
                          color: Color.fromARGB(255, 208, 49, 25),
                        )
                      : const Icon(Icons.done),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.isPremium
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Profile',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width / 5,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 208, 49, 25),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const Center(
                            child: Text(
                          '🔥 Premium',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        )),
                      )
                    ],
                  )
                : const Text(
                    'Profile',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          ClipOval(
                            child: Image.asset(
                              'assets/images/img_7xm24.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            widget.currentUser.fullName
                                    .toString()[0]
                                    .toUpperCase() +
                                widget.currentUser.fullName
                                    .toString()
                                    .substring(1),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, -1),
                          end: const Offset(0, 0),
                        ).animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: Curves.bounceOut,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Card(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 15),
                                  child: Column(
                                    children: [
                                      const Text('⚖️'),
                                      Text(
                                        widget.currentUser.weight.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Card(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 15),
                                  child: Column(
                                    children: [
                                      const Text('🧍‍♀️'),
                                      Text(widget.currentUser.height.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Card(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 15),
                                  child: Column(
                                    children: [
                                      const Text('🎂'),
                                      Text('${age} Years',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
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
                      if (!widget.isPremium)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PremiumScreen(
                                      currentUser: widget.currentUser,
                                    ),
                                  ),
                                );
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
                                'Go Premium',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.5),
                          end: const Offset(0, 0),
                        ).animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: Curves.bounceOut,
                          ),
                        ),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UpdateAccount(
                                            currentUser: widget.currentUser,
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Account'),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: Color.fromARGB(
                                              255, 231, 227, 227),
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(
                                  color: Color.fromARGB(255, 231, 227, 227),
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MyWorkOutsScreen(),
                                        ),
                                      );
                                    },
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('My workouts 🚀'),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: Color.fromARGB(
                                              255, 231, 227, 227),
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(
                                  color: Color.fromARGB(255, 231, 227, 227),
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const WorkOutReminderScreen(),
                                        ),
                                      );
                                    },
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Workout reminders'),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: Color.fromARGB(
                                              255, 231, 227, 227),
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(
                                  color: Color.fromARGB(255, 231, 227, 227),
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            FirebaseAuth.instance.signOut();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const MyApp(),
                                              ),
                                            );
                                          },
                                          child: _hindiClicked
                                              ? Text('Log out'.tr())
                                              : Text('Log out'.tr())),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Settings',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.5),
                          end: const Offset(0, 0),
                        ).animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: Curves.bounceOut,
                          ),
                        ),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Preferences'),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color:
                                            Color.fromARGB(255, 231, 227, 227),
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ),
                                const Divider(
                                  color: Color.fromARGB(255, 231, 227, 227),
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                  child: GestureDetector(
                                    onTap: () {
                                      _chooseLanguage(context);
                                    },
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Language'),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: Color.fromARGB(
                                              255, 231, 227, 227),
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(
                                  color: Color.fromARGB(255, 231, 227, 227),
                                  height: 20,
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Plan Settings'),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color:
                                            Color.fromARGB(255, 231, 227, 227),
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ),
                                const Divider(
                                  color: Color.fromARGB(255, 231, 227, 227),
                                  height: 20,
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('App Health'),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color:
                                            Color.fromARGB(255, 231, 227, 227),
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ),
                                const Divider(
                                  color: Color.fromARGB(255, 231, 227, 227),
                                  height: 20,
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Contacts Support'),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color:
                                            Color.fromARGB(255, 231, 227, 227),
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ),
                                const Divider(
                                  color: Color.fromARGB(255, 231, 227, 227),
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Pin Lock'),
                                    Column(
                                      children: [
                                        const Text(
                                            ''), // Empty text to create space
                                        Switch(
                                          value: _pinLock,
                                          activeTrackColor:
                                              const Color.fromARGB(
                                                  255, 208, 49, 25),
                                          onChanged: (bool value) {
                                            setState(() {
                                              _pinLock = value;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Color.fromARGB(255, 231, 227, 227),
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Apple Health'),
                                    Column(
                                      children: [
                                        const Text(
                                            ''), // Empty text to create space
                                        Switch(
                                          value: _appleHealth,
                                          activeTrackColor:
                                              const Color.fromARGB(
                                                  255, 208, 49, 25),
                                          onChanged: (bool value) {
                                            setState(() {
                                              _appleHealth = value;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
