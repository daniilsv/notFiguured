import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class ActivityLevelViewModel extends BaseViewModel {
  ActivityLevelViewModel(BuildContext context) {
    navigator = Navigator.of(context);
  }

  NavigatorState navigator;

  List<Activity> activities;

  Activity activityType = Activity.moderatelyactive;
  double get currentIndex =>
      activities.indexWhere((element) => element == activityType).toDouble();

  void onReady() {
    activities = Activity.values.toList();
    activities.remove(Activity.swaggerGeneratedUnknown);
    notifyListeners();
  }

  void onActivityChange(_, dynamic low, dynamic high) {
    if (low is! double) return;
    final value = low.round().clamp(0, activities.length - 1);
    activityType = activities[value];
    notifyListeners();
  }

  void done() => navigator.pop(activityType);
}
