import 'package:fitnessapp/data/training_data.dart';

class GetItUserData {
  List<PopularWorkouts> sortedWorkOutsList = [];
  List<Training> sortedPersonalTrainingList = [];
  List<Training> sortedTrainingList = [];

  List<PopularWorkouts> loadPopularWorkOutData(String groupName) {
    sortedWorkOutsList.clear();
    for (var workouts in popularWorkoutLists) {
      bool isTrue = workouts.groups.contains(groupName);
      if (isTrue) {
        sortedWorkOutsList.add(workouts);
      }
    }
    return sortedWorkOutsList;
  }

  // List<Training> loadPersonalTrainingData(String groupName) {
  //   sortedPersonalTrainingList.clear();
  //   for (var trinings in trainingLists) {
  //     bool isTrue = trinings.groups!.contains(groupName);
  //     if (isTrue) {
  //       sortedPersonalTrainingList.add(trinings);
  //     }
  //   }
  //   return sortedPersonalTrainingList;
  // }

  List<Training> loadTrainingData(String groupName) {
    sortedTrainingList.clear();
    for (var trinings in trainingLists) {
      bool isTrue = trinings.groups!.contains(groupName);
      if (isTrue) {
        sortedTrainingList.add(trinings);
      }
    }
    return sortedTrainingList;
  }
}
