import 'package:fitnessapp/data/training_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkOutFavoriteProvider extends StateNotifier<List<PopularWorkouts>> {
  WorkOutFavoriteProvider() : super([]);

  bool workoutFavoriteStatus(PopularWorkouts workout) {
    final workoutFavorite = state.contains(workout);
    if (workoutFavorite) {
      state.remove(workout);
      return false;
    } else {
      state = [...state, workout];
      return true;
    }
  }
}

final workoutFavoriteProvider =
    StateNotifierProvider<WorkOutFavoriteProvider, List<PopularWorkouts>>(
        (ref) {
  return WorkOutFavoriteProvider();
});
