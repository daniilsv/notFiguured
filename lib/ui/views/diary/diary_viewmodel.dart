import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/data/repository/diary_repository.dart';
import 'package:notfiguured/data/repository/user_repository.dart';
import 'package:notfiguured/data/services/diary_service.dart';
import 'package:notfiguured/data/services/exercise_service.dart';
import 'package:notfiguured/data/services/food_service.dart';
import 'package:notfiguured/ui/views/diary_exercise/diary_exercise_view.dart';
import 'package:notfiguured/ui/views/diary_exercise/training/training_view.dart';
import 'package:notfiguured/ui/views/diary_food/diary_food_view.dart';
import 'package:notfiguured/ui/views/diary_food/meal/meal_view.dart';
import 'package:notfiguured/ui/views/goal_control/calories_goal_control/calories_goal_control_view.dart';
import 'package:notfiguured/ui/views/goal_control/macronutrition_goal_control/macronutrition_goal_control_view.dart';
import 'package:notfiguured/ui/views/goal_control/weight_goal_control/weight_goal_control_view.dart';
import 'package:notfiguured/ui/views/goal_create/goal_create.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/widgets.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

class DiaryViewModel extends AppViewModel {
  DiaryViewModel([BuildContext context]) : super(context) {
    _userRepository = context.read<UserRepository>();
    diaryService = context.read<DiaryService>();
    diaryService.addListener(onRepoChanged);

    foodService = context.read<FoodService>();
    foodService.addListener(loadFoodDiary);
    exerciseService = context.read<ExerciseService>();
    exerciseService.addListener(loadExerciseDiary);
  }
  DiaryService diaryService;
  ExerciseService exerciseService;
  FoodService foodService;
  UserRepository _userRepository;

  DiaryRepository get repository => diaryService.repository;
  TargetCurrentFactModel get current => repository.current.val;
  String get nickname => _userRepository.userModel.val.userAccountData?.nickName;

  List<Object> get goalsList => [
        repository.weight.val,
        repository.calories.val,
        repository.macro.val
      ].where((el) => el != null).toList();

  bool get isEmpty => goalsList.isEmpty;

  double exerciseToday;
  DiaryDayModel todayFood;

  void onRepoChanged() {
    notifyListeners();
  }

  void onNewGoalTap() {
    navigator.push(
      GoalCreateRoute(
        predefinedWeight: repository.weight.val == null
            ? null
            : PredefinedGoalData(
                weight: repository.weight.val.startWeight,
                goal: repository.weight.val.endWeight,
              ),
        predefinedCalories: repository?.calories?.val == null
            ? null
            : PredefinedGoalData(
                calories: repository.calories.val?.calories,
                mo: repository.calories.val.mo,
                tu: repository.calories.val.tu,
                we: repository.calories.val.we,
                th: repository.calories.val.th,
                fr: repository.calories.val.fr,
                sa: repository.calories.val.sa,
                su: repository.calories.val.su,
              ),
        predefinedMacronutrition: repository.macro.val == null
            ? null
            : PredefinedGoalData(
                protein: repository.macro.val.protein,
                fat: repository.macro.val.fat,
                carbon: repository.macro.val.carbon,
              ),
      ),
    );
  }

  Future toWeightGoalControl() => navigator.push(WeightGoalControlRoute());
  Future toCaloriesGoalControl() => navigator.push(CaloriesGoalControlRoute());
  Future toMacronutritionGoalControl() =>
      navigator.push(MacronutritionGoalControlRoute());
  Future toDiaryFood() => navigator.push(DiaryFoodRoute());
  Future toDiaryExercise() => navigator.push(DiaryExerciseRoute());
  Future onEmptyFoodDiaryTap() =>
      navigator.push(MealRoute(date: Jiffy().startOf(Units.DAY)));
  Future onEmptyExcerciseDiaryTap() =>
      navigator.push(TrainingRoute(date: Jiffy().startOf(Units.DAY)));

  double get _userWeight => _userRepository.userModel.val?.weight;
  double get userWeight => _userWeight ?? 70;

  Future onReady() async {
    diaryService.getDiary();
    await Future.wait([
      loadExerciseDiary(),
      loadFoodDiary(),
    ]);
    notifyListeners();
  }

  Future loadExerciseDiary() async {
    final selectedDate = Jiffy().startOf(Units.DAY);
    final currentDayTrainings = await exerciseService.getDiary(date: selectedDate);
    final currentDayDiary =
        currentDayTrainings.isEmpty ? null : currentDayTrainings.first;

    exerciseToday = currentDayDiary?.exercises
        ?.sumByDouble((ex) => ex.amount / 60 * ex.calories * userWeight);
    notifyListeners();
  }

  Future loadFoodDiary() async {
    final selectedDate = Jiffy().startOf(Units.DAY);
    todayFood = await foodService.getDiary(date: selectedDate);
    notifyListeners();
  }

  @override
  void errorRequest([int errorStatus]) {}

  @override
  void dispose() {
    diaryService.removeListener(onRepoChanged);
    super.dispose();
  }
}
