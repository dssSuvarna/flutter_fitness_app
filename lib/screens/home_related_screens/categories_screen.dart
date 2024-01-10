import 'package:fitnessapp/data/category_data.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFFFFFFF),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                /* -- Text and Icon -- */
                hintText: "search something",
                hintStyle: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFFB3B1B1),
                ), // TextStyle
                prefixIcon: const Icon(
                  Icons.search,
                  size: 26,
                  color: Colors.black54,
                ), // Icon
                /* -- Border Styling -- */
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    width: 1.0,
                    color: Color(0xFFFF0000),
                  ), // BorderSide
                ), // OutlineInputBorder
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    width: 1.0,
                    color: Color.fromARGB(255, 231, 227, 227),
                  ), // BorderSide
                ), // OutlineInputBorder
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    width: 1.0,
                    color: Color.fromARGB(255, 208, 49, 25),
                  ), // BorderSide
                ), // OutlineInputBorder
              ), // InputDecoration
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (final category in categories)
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(
                                  255, 231, 227, 227), // Border color
                              width: 1.0, // Border width
                            ),
                            borderRadius: BorderRadius.circular(
                                12.0), // Optional: for rounded corners
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 15, 15, 15),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                category.colors.first,
                                                category.colors.last
                                              ])),
                                      child: Center(
                                        child: Text(
                                          category.emoji,
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          category.name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          category.workouts,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Color.fromARGB(
                                                  255, 133, 130, 130)),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Color.fromARGB(255, 231, 227, 227),
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
