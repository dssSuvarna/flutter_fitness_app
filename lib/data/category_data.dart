import 'package:flutter/material.dart';

class Category {
  const Category(
      {required this.emoji,
      required this.name,
      required this.workouts,
      required this.colors});
  final String emoji;
  final String name;
  final String workouts;
  final List<Color> colors;
}

const categories = [
  Category(emoji: '🧘', name: 'Yoga', workouts: '2 workouts', colors: [
    Color.fromARGB(255, 68, 164, 242),
    Color.fromARGB(255, 112, 160, 242)
  ]),
  Category(emoji: '🤸‍♂️', name: 'Stretch', workouts: '16 workouts', colors: [
    Color.fromARGB(255, 246, 230, 87),
    Color.fromARGB(255, 251, 251, 174)
  ]),
  Category(emoji: '\u{1F94A}', name: 'Boxing', workouts: '3 workouts', colors: [
    Color.fromARGB(255, 245, 106, 153),
    Color.fromARGB(255, 241, 151, 181)
  ]),
  Category(
      emoji: '\u{1F3C3}',
      name: 'Running',
      workouts: '10 workouts',
      colors: [
        Color.fromARGB(255, 86, 158, 192),
        Color.fromARGB(255, 129, 181, 205)
      ]),
  Category(emoji: '💪', name: 'Upper Body', workouts: '9 workouts', colors: [
    Color.fromARGB(255, 219, 85, 75),
    Color.fromARGB(255, 240, 146, 146)
  ]),
  Category(emoji: '🏋️', name: 'Gym', workouts: '17 workouts', colors: [
    Color.fromARGB(255, 92, 173, 95),
    Color.fromARGB(255, 113, 154, 134)
  ])
];
