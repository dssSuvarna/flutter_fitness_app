class Exercise {
  const Exercise(
      {required this.image,
      required this.name,
      required this.time,
      required this.iconImage,
      required this.description,
      required this.groups,
      required this.techniques});
  final String image;
  final String name;
  final String time;
  final String iconImage;
  final String description;
  final List<String> groups;
  final List<String> techniques;
}

const exercises = [
  Exercise(
    image: 'assets/images/img_7xm10.png',
    name: 'Front and back Lunge',
    time: '0:30',
    iconImage: 'assets/images/img_info.svg',
    description:
        "Front and back lunges are leg-strengthening exercises involving stepping forward or backward, effectively targeting the quadriceps and hamstrings.",
    groups: ['All exercises', 'Leg'],
    techniques: [
      '1. Stand with feet hip-width apart',
      '2.Take a step forward with one foot, ensuring the knee is directly above the ankle.',
      '3.Lower your hips until both knees are bent at about a 90-degree angle.'
    ],
  ),
  Exercise(
    image: 'assets/images/img_7xm11.png',
    name: 'Side Plank',
    time: '0:30',
    iconImage: 'assets/images/img_info.svg',
    description:
        "The side plank is a core-strengthening exercise where the body forms a straight line from head to heels while supported on one forearm, engaging the obliques for improved core stability.",
    groups: ['All exercises', 'Leg'],
    techniques: [
      '1. Stand with feet hip-width apart',
      '2.Take a step forward with one foot, ensuring the knee is directly above the ankle.',
      '3.Lower your hips until both knees are bent at about a 90-degree angle.'
    ],
  ),
  Exercise(
    image: 'assets/images/img_7xm13.png',
    name: 'Arm Cirles',
    time: '0:30',
    iconImage: 'assets/images/img_info.svg',
    description:
        "Arm circles are a shoulder flexibility and warm-up exercise where you rotate your arms in circular motions, enhancing joint mobility and blood flow to the shoulder muscles.",
    groups: [
      'All exercises',
      'Arms',
    ],
    techniques: [
      '1. Stand with feet hip-width apart',
      '2.Take a step forward with one foot, ensuring the knee is directly above the ankle.',
      '3.Lower your hips until both knees are bent at about a 90-degree angle.'
    ],
  ),
  Exercise(
    image: 'assets/images/img_7xm12.png',
    name: 'Sumo Squat',
    time: '0:30',
    iconImage: 'assets/images/img_info.svg',
    description:
        "Sumo squats are a lower-body exercise involving a wide stance and toes pointed outward, targeting the inner thighs, glutes, and quadriceps for improved strength and muscle development.",
    groups: ['All exercises', 'Arms', 'Chest', 'Leg'],
    techniques: [
      '1. Stand with feet hip-width apart',
      '2.Take a step forward with one foot, ensuring the knee is directly above the ankle.',
      '3.Lower your hips until both knees are bent at about a 90-degree angle.'
    ],
  ),
  Exercise(
    image: 'assets/images/img_7xm26.png',
    name: 'Cobra Stretch',
    time: '0:30',
    iconImage: 'assets/images/img_info.svg',
    description:
        "The cobra stretch is a yoga pose that involves lying prone on the floor and arching the upper body upward, promoting flexibility and strength in the spine while stretching the abdominal muscles.",
    groups: ['All exercises', 'Arms', 'Chest', 'Leg'],
    techniques: [
      '1. Stand with feet hip-width apart',
      '2.Take a step forward with one foot, ensuring the knee is directly above the ankle.',
      '3.Lower your hips until both knees are bent at about a 90-degree angle.'
    ],
  ),
  Exercise(
    image: 'assets/images/img_7xm27.png',
    name: 'Plank Ups',
    time: '0:30',
    iconImage: 'assets/images/img_info.svg',
    description:
        "Plank ups are a dynamic core exercise where you transition from a forearm plank to a high plank position, engaging both the abdominal and upper body muscles for enhanced strength and stability.",
    groups: ['All exercises', 'Arms', 'Leg'],
    techniques: [
      '1. Stand with feet hip-width apart',
      '2.Take a step forward with one foot, ensuring the knee is directly above the ankle.',
      '3.Lower your hips until both knees are bent at about a 90-degree angle.'
    ],
  ),
  Exercise(
    image: 'assets/images/img_7xm28.png',
    name: 'Plank Reaches',
    time: '0:30',
    iconImage: 'assets/images/img_info.svg',
    description:
        "Plank reaches involve extending one arm forward while maintaining a plank position, effectively engaging the core muscles and enhancing stability and balance.",
    groups: ['All exercises', 'Arms', 'Leg'],
    techniques: [
      '1. Stand with feet hip-width apart',
      '2.Take a step forward with one foot, ensuring the knee is directly above the ankle.',
      '3.Lower your hips until both knees are bent at about a 90-degree angle.'
    ],
  ),
  Exercise(
    image: 'assets/images/img_7xm29.png',
    name: 'Skater Aquat Right',
    time: '0:30',
    iconImage: 'assets/images/img_info.svg',
    description:
        "It seems like there might be a typo or confusion in your query. If you are referring to the Skater Squat,it's an exercise that involves a lateral movement resembling the motion of a skater",
    groups: ['All exercises', 'Arms', 'Chest', 'Leg'],
    techniques: [
      '1. Stand with feet hip-width apart',
      '2.Take a step forward with one foot, ensuring the knee is directly above the ankle.',
      '3.Lower your hips until both knees are bent at about a 90-degree angle.'
    ],
  ),
  Exercise(
    image: 'assets/images/img_7xm30.png',
    name: 'Squat Jump',
    time: '0:30',
    iconImage: 'assets/images/img_info.svg',
    description:
        "Squat jumps are explosive lower-body exercises where you transition from a squat position to a powerful jump, engaging the muscles in your legs and core for strength, power, and cardiovascular benefits.",
    groups: ['All exercises', 'Arms', 'Chest', 'Leg'],
    techniques: [
      '1. Stand with feet hip-width apart',
      '2.Take a step forward with one foot, ensuring the knee is directly above the ankle.',
      '3.Lower your hips until both knees are bent at about a 90-degree angle.'
    ],
  )
];

const exerciseGroups = ['All exercises', 'Arms', 'Chest', 'Leg'];
