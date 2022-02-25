import 'dart:async';

import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/data/repository/user_repository.dart';
import 'package:notfiguured/ui/views/diary_exercise/fill_exercise/fill_exercise_view.dart';
import 'package:notfiguured/utils/debouncer.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';

class PickExerciseViewModel extends AppViewModel {
  PickExerciseViewModel(BuildContext context, {this.training}) : super(context) {
    _keyboardSub = KeyboardVisibilityController().onChange.listen(
      (bool visible) {
        keyboardVisible = visible;
        notifyListeners();
      },
    );
    userRepository = context.read<UserRepository>();
  }
  DiaryDayExercises training;
  UserRepository userRepository;
  double get _userWeight => userRepository.userModel.val?.weight;
  double get userWeight => _userWeight ?? 70;

  final TextEditingController searchController = TextEditingController();
  final List<ExerciseSimpleModel> foundExercises = <ExerciseSimpleModel>[];
  StreamSubscription _keyboardSub;
  bool keyboardVisible = false;

  bool get isEmptyList =>
      (keyboardVisible && foundExercises.isEmpty || !keyboardVisible) &&
      searchController.text.isEmpty;
  bool get exercisesNotFound =>
      keyboardVisible && foundExercises.isEmpty && searchController.text.isNotEmpty;

  Future<void> onReady() async {
    final debouncer = Debouncer<String>(
      const Duration(milliseconds: 500),
      searchExercises,
    );
    searchController.addListener(() {
      debouncer.value = searchController.text.trim();
    });
  }

  Future<void> searchExercises(String name) async {
    if (name.isEmpty) {
      foundExercises.clear();
      return notifyListeners();
    }
    final res = await api.api.v1ExerciseFindExercisePost(name: name, body: {});
    if (res.isSuccessful) {
      foundExercises.clear();
      foundExercises.addAll(res.body);
      notifyListeners();
    }
  }

  Future<void> onExerciseTap(ExerciseSimpleModel exercise) async {
    final result = await navigator.push(
      FillExerciseRoute(
        FillExerciseDependency(
          exercise: exercise,
          training: training,
        ),
      ),
    );
    if (result == null) return;
    navigator.pop();
  }

  @override
  void dispose() {
    _keyboardSub?.cancel();
    super.dispose();
  }

  @override
  void errorRequest([int errorStatus]) {}
}
