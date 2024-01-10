class Training {
  const Training(
      {this.image,
      this.name,
      this.time,
      this.groups,
      required this.discription});
  final String? image;
  final String? name;
  final String? time;
  final List<String>? groups;
  final String discription;
}

class PopularWorkouts {
  const PopularWorkouts(
      {required this.image,
      required this.name,
      required this.time,
      required this.groups,
      required this.discription});
  final String image;
  final String name;
  final String time;
  final List<String> groups;
  final String discription;
}

const trainingLists = [
  Training(
    image: 'assets/images/training1.png',
    name: 'Core Control',
    time: '32min',
    groups: [
      'Beginner',
    ],
    discription:
        'Stability exercises emphasizing controlled movements to strengthen and engage the core muscles.',
  ),
  Training(
    image: 'assets/images/training2.png',
    name: 'Full Body Fast',
    time: '32min',
    groups: ['Beginner'],
    discription:
        'High-intensity, full-body workout incorporating fast-paced movements for a quick and efficient exercise session.',
  ),
  Training(
    image: 'assets/images/training3.png',
    name: 'Express Tabata',
    time: '32min',
    groups: ['Beginner', 'Intermediate'],
    discription:
        'Intense and time-efficient Tabata workout involving short bursts of high-intensity exercises alternated with brief rest periods for a quick and effective full-body training.',
  ),
  Training(
    image: 'assets/images/training4.png',
    name: 'BodyWeight Stretch',
    time: '32min',
    groups: ['Beginner', 'Advanced'],
    discription:
        'Dynamic stretching routine using only body weight to enhance flexibility and promote overall muscle mobility.',
  ),
  Training(
    image: 'assets/images/training5.png',
    name: 'Glutes & Abs',
    time: '32min',
    groups: ['Beginner', 'Advanced'],
    discription:
        'Targeted workout focusing on strengthening and toning the glutes and abs for a sculpted lower body and core.',
  ),
  Training(
    image: 'assets/images/training6.png',
    name: 'Interval Pilates',
    time: '32min',
    groups: ['Beginner'],
    discription:
        'Interval-based Pilates routine combining controlled movements and dynamic exercises for a comprehensive and effective full-body workout.',
  ),
  Training(
    image: 'assets/images/img_7xm39.png',
    name: 'Boxing Session',
    time: '12min',
    groups: ['Intermediate', 'Advanced'],
    discription:
        'High-energy boxing session incorporating punches, kicks, and cardio exercises for a dynamic and intense full-body workout.',
  ),
  Training(
    image: 'assets/images/img_7xm40.png',
    name: 'Tabata',
    time: '27min',
    groups: ['Beginner', 'Intermediate'],
    discription:
        'Tabata: A high-intensity interval training (HIIT) workout featuring 20 seconds of all-out effort followed by 10 seconds of rest, repeated for a quick and effective total-body burn.',
  ),
];

const trainingGroups = ['Beginner', 'Irregular training', 'Medium', 'Advanced'];
const trainingGrps = ['Beginner', 'Intermediate', 'Advanced'];
const subscriptionTypes = ['Free', 'Premium'];
const timeDurations = ['15-20 min', '20-30 min', '30-40 min'];
const equipments = ['Dumbles', 'Mat'];

const popularWorkoutLists = [
  PopularWorkouts(
      image: 'assets/images/img_7xm9.png',
      name: 'Rapid Lower Body',
      time: '42min',
      groups: [
        'Beginner',
        'Intermediate',
        'Advanced',
      ],
      discription:
          'High-intensity squat jumps for a rapid lower body workout, targeting muscles from thighs to calves.'),
  PopularWorkouts(
      image: 'assets/images/img_7xm8.png',
      name: 'Body Weight Stretch',
      time: '42min',
      groups: [
        'Beginner',
        'Intermediate',
        'Advanced',
      ],
      discription:
          'Full-body dynamic stretches using body weight to improve flexibility and range of motion.'),
];
