import 'package:notfiguured/data/repository/static_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class DatezoneViewModel extends BaseViewModel {
  DatezoneViewModel(BuildContext context) {
    navigator = Navigator.of(context);
    _staticRepository = context.read<StaticRepository>();
    filteredTimezones = _staticRepository.timezones.val;
    searchController.addListener(_onSearchChanged);
  }

  NavigatorState navigator;
  StaticRepository _staticRepository;

  String search = '';
  TextEditingController searchController = TextEditingController();

  Map<String, String> filteredTimezones = {};

  List<String> get filteredKeys => filteredTimezones?.keys?.toList() ?? [];

  void _onSearchChanged() {
    search = searchController.text;
    Map<String, String> _filteredTimezones = {};
    if (search?.isEmpty ?? true) {
      _filteredTimezones = _staticRepository.timezones.val;
    } else {
      _staticRepository.timezones.val.forEach(
        (key, value) {
          if (value.toLowerCase().contains(search.toLowerCase())) {
            _filteredTimezones[key] = value;
          }
        },
      );
    }
    filteredTimezones = Map<String, String>.from(_filteredTimezones);
    notifyListeners();
  }

  void done(String timezoneKey) => navigator.pop(
        MapEntry(
          timezoneKey,
          filteredTimezones[timezoneKey],
        ),
      );
}
