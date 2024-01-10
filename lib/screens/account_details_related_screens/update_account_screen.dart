import 'package:fitnessapp/model/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpdateAccount extends StatefulWidget {
  const UpdateAccount({super.key, required this.currentUser});

  final UserData currentUser;

  @override
  State<UpdateAccount> createState() => _UpdateAccountState();
}

class _UpdateAccountState extends State<UpdateAccount> {
  String? formattedDate;

  @override
  void initState() {
    super.initState();
    _formatDob(widget.currentUser.dob!);
  }

  void _formatDob(String dob) {
    DateTime date = DateFormat("dd/MM/yyyy").parse(dob);
    formattedDate = DateFormat("MMM dd, yyyy").format(date);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Account Information',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: Text(
                'Save',
                style: TextStyle(color: Color.fromARGB(255, 208, 49, 25)),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ClipOval(
              child: Image.asset(
                'assets/images/img_7xm24.png',
                width: 80,
                height: 80,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Name'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(widget.currentUser.fullName!),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Color.fromARGB(255, 231, 227, 227),
                                size: 15,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 231, 227, 227),
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Weight'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(widget.currentUser.weight!),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Color.fromARGB(255, 231, 227, 227),
                                size: 15,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 231, 227, 227),
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Date of Birth'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(formattedDate!),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Color.fromARGB(255, 231, 227, 227),
                                size: 15,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 231, 227, 227),
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Email'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(widget.currentUser.email!),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Color.fromARGB(255, 231, 227, 227),
                                size: 15,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
