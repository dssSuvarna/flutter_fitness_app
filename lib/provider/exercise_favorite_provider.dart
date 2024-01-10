import 'package:fitnessapp/data/exercises_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExerciseFavoriteProvider extends StateNotifier<List<Exercise>> {
  ExerciseFavoriteProvider() : super([]);

  bool workoutFavoriteStatus(Exercise exercise) {
    final exerciseFavorite = state.contains(exercise);
    if (exerciseFavorite) {
      state.remove(exercise);
      return false;
    } else {
      state = [...state, exercise];
      return true;
    }
  }
}

final exerciseFavoriteProvider =
    StateNotifierProvider<ExerciseFavoriteProvider, List<Exercise>>((ref) {
  return ExerciseFavoriteProvider();
});
