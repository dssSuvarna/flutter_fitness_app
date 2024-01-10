import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/provider/user_provider.dart';
import 'package:fitnessapp/screens/account_related_screens/gender_screen.dart';
import 'package:fitnessapp/screens/account_related_screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

final _fireBase = FirebaseAuth.instance;
final formater = DateFormat.yMd();

class CreateAccount extends ConsumerStatefulWidget {
  CreateAccount({super.key, required this.toSignUp});

  bool toSignUp;

  @override
  ConsumerState<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends ConsumerState<CreateAccount>
    with SingleTickerProviderStateMixin {
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _enteredPhone = '';
  var _enteredName = '';
  bool _isValidEmail = true;
  bool _isValidPassword = true;
  bool _isValidName = true;
  bool _isValidPhone = true;
  bool _isValidDob = true;
  DateTime? _selectDate;
  bool _signIn = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _animationController.forward();
  }

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

  void _validateInputs() {
    if (_enteredPassword.length < 6 || _enteredPassword.length > 6) {
      _showErrorFlushbar(
          Icons.error, 'ERROR', 'Password must be 6 digits only', Colors.red);
      return;
    }
    if (!_enteredEmail.contains('@')) {
      _showErrorFlushbar(
          Icons.error, 'ERROR', 'Email badly formated', Colors.red);
      return;
    }
    if (_enteredPhone.length < 10 || _enteredPhone.length > 10) {
      _showErrorFlushbar(Icons.error, 'ERROR',
          'Phone number must be 10 digits only', Colors.red);
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GenderScreen(),
      ),
    );
  }

  void _submit() async {
    try {
      if (_enteredPassword.length < 6 || _enteredPassword.length > 6) {
        _showErrorFlushbar(
            Icons.error, 'ERROR', 'Password must be 6 digits only', Colors.red);
        return;
      }
      if (!_enteredEmail.contains('@')) {
        _showErrorFlushbar(
            Icons.error, 'ERROR', 'Email badly formated', Colors.red);
        return;
      }
      // showDialog(
      //     context: context,
      //     builder: (context) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     });
      // Navigator.of(context).pop();

      await _fireBase.signInWithEmailAndPassword(
          email: _enteredEmail, password: _enteredPassword);

      // Navigator.of(context).pop();
      _signIn = true;
      await Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Splash(),
          ),
        );
      });
      _showErrorFlushbar(Icons.check_circle_rounded, 'SUCCESS',
          'Logged in successfully', Colors.lightGreen);
    } on FirebaseAuthException catch (error) {
      _showErrorFlushbar(
          Icons.error, 'ERROR', 'Invalid Credentials', Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.toSignUp
          ? SafeArea(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
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
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                  filled: true,
                                  hintText: 'Full Name',
                                  errorText:
                                      !_isValidName ? 'Name is must' : null,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              onChanged: (value) {
                                _enteredName = value;
                                ref
                                    .read(userProvider.notifier)
                                    .setFullName(value);
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  filled: true,
                                  hintText: 'Email',
                                  errorText:
                                      !_isValidEmail ? 'Email is must' : null,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              onChanged: (value) {
                                _enteredEmail = value;
                                ref.read(userProvider.notifier).setEmail(value);
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                filled: true,
                                hintText: _selectDate == null
                                    ? 'Date of birth'
                                    : formater.format(_selectDate!),
                                errorText: !_isValidDob ? 'DOB is must' : null,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              onTap: () {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Done'),
                                          ),
                                          Expanded(
                                            child: CupertinoDatePicker(
                                              mode:
                                                  CupertinoDatePickerMode.date,
                                              initialDateTime: _selectDate,
                                              minimumDate: DateTime(1900),
                                              maximumDate: DateTime.now().add(
                                                  const Duration(
                                                      days: 2 * 365)),
                                              onDateTimeChanged: (date) {
                                                setState(() {
                                                  _selectDate = date;
                                                  ref
                                                      .read(
                                                          userProvider.notifier)
                                                      .setDob(formater.format(
                                                          _selectDate!));
                                                });
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  filled: true,
                                  hintText: 'Phone',
                                  errorText: !_isValidPhone
                                      ? 'Phone number is nust'
                                      : null,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              onChanged: (value) {
                                _enteredPhone = value;
                                ref.read(userProvider.notifier).setPhone(value);
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  filled: true,
                                  hintText: 'Password',
                                  errorText: !_isValidPassword
                                      ? 'Password is must'
                                      : null,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              onChanged: (value) {
                                _enteredPassword = value;
                                ref
                                    .read(userProvider.notifier)
                                    .setPassword(value);
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_enteredEmail == '' ||
                              _enteredPassword == '' ||
                              _enteredName == '' ||
                              _enteredPhone == '' ||
                              _selectDate == null) {
                            setState(() {
                              _isValidEmail =
                                  _enteredEmail == '' ? false : true;
                              _isValidPassword =
                                  _enteredPassword == '' ? false : true;
                              _isValidName = _enteredName == '' ? false : true;
                              _isValidPhone =
                                  _enteredPhone == '' ? false : true;
                              _isValidDob = _selectDate == null ? false : true;
                            });
                          } else {
                            _validateInputs();
                          }
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
                          'Sign Up',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'sign in with',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/pngimg.com - apple_logo_PNG19674.png',
                              fit: BoxFit.cover,
                              height: 65,
                              width: 65,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              'assets/images/pngimg.com - facebook_logos_PNG19754.png',
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              'assets/images/pngimg.com - google_PNG19635.png',
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Have an account?',
                            textAlign: TextAlign.center,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.toSignUp = false;
                              });
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
                      )
                    ],
                  ),
                ),
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 130, 20, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
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
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                filled: true,
                                hintText: 'Email',
                                errorText:
                                    !_isValidEmail ? 'Email is must' : null,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onChanged: (value) {
                                _enteredEmail = value;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                hintText: 'Password',
                                errorText: !_isValidPassword
                                    ? 'Password is must'
                                    : null,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onChanged: (value) {
                                _enteredPassword = value;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_enteredEmail == '' || _enteredPassword == '') {
                            setState(() {
                              _isValidEmail =
                                  _enteredEmail == '' ? false : true;
                              _isValidPassword =
                                  _enteredPassword == '' ? false : true;
                            });
                          } else {
                            setState(() {
                              _isValidEmail = true;
                              _isValidPassword = true;
                            });
                            _submit();
                          }
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
                        child: _signIn
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
                                'Sign In',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18),
                              ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Forgot Password?',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      const Text(
                        'Sign in with',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/pngimg.com - apple_logo_PNG19674.png',
                              fit: BoxFit.cover,
                              height: 65,
                              width: 65,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              'assets/images/pngimg.com - facebook_logos_PNG19754.png',
                              fit: BoxFit.cover,
                              height: 50,
                              width: 50,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              'assets/images/pngimg.com - google_PNG19635.png',
                              fit: BoxFit.cover,
                              height: 50,
                              width: 50,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Dont have an account?',
                            textAlign: TextAlign.center,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CreateAccount(
                                    toSignUp: true,
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              ' Sign up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 208, 49, 25),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
