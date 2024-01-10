import 'package:fitnessapp/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProvider extends StateNotifier<UserData> {
  UserProvider() : super(UserData());

  void setFullName(String fullName) {
    state.fullName = fullName;
  }

  void setEmail(String email) {
    state.email = email;
  }

  void setPassword(String password) {
    state.password = password;
  }

  void setPhone(String phone) {
    state.phone = phone;
  }

  void setGender(String gender) {
    state.gender = gender;
  }

  void setGoal(String goal) {
    state.goal = goal;
  }

  void setHeight(String height) {
    state.height = height;
  }

  void setWeight(String weight) {
    state.weight = weight;
  }

  void setTrainingLevel(String level) {
    state.trainingLevel = level;
  }

  void setInterest(String interest) {
    state.interest = interest;
  }

  void setDob(String dob) {
    state.dob = dob;
  }
}

final userProvider = StateNotifierProvider<UserProvider, UserData>((ref) {
  return UserProvider();
});
