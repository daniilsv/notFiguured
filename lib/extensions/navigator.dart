import 'package:flutter/cupertino.dart';

extension NavigatorExtension on NavigatorState {
  void popBeforeNamed(String routeName) {
    bool foundRoute = false;
    popUntil((route) {
      if (route.settings?.name?.toLowerCase()?.contains(routeName) ?? false) {
        foundRoute = true;
        return false;
      }
      return foundRoute;
    });
  }
}
