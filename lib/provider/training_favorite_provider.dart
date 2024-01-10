import 'package:fitnessapp/data/training_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrainingFavoriteProvider extends StateNotifier<List<Training>> {
  TrainingFavoriteProvider() : super([]);

  bool toggleMealFavoriteStatus(Training training) {
    final trainingsFavorite = state.contains(training);
    if (trainingsFavorite) {
      state.remove(training);
      return false;
    } else {
      state = [...state, training];
      return true;
    }
  }
}

final trainingFavoriteProvider =
    StateNotifierProvider<TrainingFavoriteProvider, List<Training>>((ref) {
  return TrainingFavoriteProvider();
});
