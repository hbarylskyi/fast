import 'package:flutter/material.dart';

class FastSettingsState with ChangeNotifier {
  late int _fastStart;
  late int _fastDuration;
  late bool _didSwipeRight;

  FastSettingsState() {
    _fastStart = 10;
    _fastDuration = 11;
    _didSwipeRight = false;
  }

  int get fastStart => _fastStart;

  set fastStart(int fastStart) {
    _fastStart = fastStart;
    notifyListeners();
  }

  int get fastDuration => _fastDuration;

  set fastDuration(int fastDuration) {
    _fastDuration = fastDuration;
    notifyListeners();
  }

  bool get didSwipeRight => _didSwipeRight;

  swipedRight() {
    _didSwipeRight = true;
    notifyListeners();
  }
}
