import 'package:flutter/material.dart';


// SignIn checkbox Provider
class CheckboxProvider extends ChangeNotifier {
  bool _isChecked = false;

  bool get isChecked => _isChecked;

  set isChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  void toggleCheckbox(bool? newValue) {
    isChecked = newValue ?? false;
  }
}


// Gender Provider
class OptionsProvider with ChangeNotifier {
  List<String> options = ['Male', 'Female'];
  String currentOption = 'Male';

  void updateCurrentOption(String value) {
    currentOption = value;
    notifyListeners();
  }
}