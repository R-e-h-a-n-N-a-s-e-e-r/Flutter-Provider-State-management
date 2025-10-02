import 'package:flutter/material.dart';

class SliderProvider with ChangeNotifier {
  double _value = 1.0;

  double get value => _value;

  void onChangeValue(double val) {
    _value = val;
    notifyListeners();
  }
}
