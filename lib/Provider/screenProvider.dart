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
