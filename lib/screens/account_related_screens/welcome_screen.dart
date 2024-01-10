import 'package:fitnessapp/screens/account_related_screens/create_account.dart';
import 'package:fitnessapp/screens/account_related_screens/welcome_page.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 208, 49, 25),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: const [
                  WelcomePage(
                    imagePath: 'assets/images/img_7xm4.png',
                    title: 'Welcome to Grace',
                    description:
                        'Grace has workouts on demand that you can find based on how much time you have',
                  ),
                  WelcomePage(
                    imagePath: 'assets/images/img_7xm2.png',
                    title: 'Welcome Categories',
                    description:
                        'Workout categories helps you to gain strength,get in better shape and embrace A healthy lifestyle',
                  ),
                  WelcomePage(
                    imagePath: 'assets/images/img_7xm3.png',
                    title: 'Custom Workouts',
                    description:
                        'Create and save your own custom workouts. Name your workouts, save them, and they will automatically appear when you are ready to workout',
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: DotsIndicator(
                dotsCount: 3,
                position: _currentPage,
                decorator: const DotsDecorator(
                    color: Color.fromARGB(255, 121, 120, 120),
                    activeColor: Color.fromARGB(255, 208, 49, 25),
                    activeSize: Size(13.0, 13.0)),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateAccount(
                                toSignUp: true,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 208, 49, 25),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Get Started',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            textAlign: TextAlign.center,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CreateAccount(
                                    toSignUp: false,
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              ' Sign in',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 208, 49, 25),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
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
