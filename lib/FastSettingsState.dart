import 'package:flutter/material.dart';

class FastSettingsState with ChangeNotifier {
  late int _fastStart;
  late int _fastDuration;
  late bool _didSwipeRight;

  FastSettingsState() {
    _fastStart = 12;
    _fastDuration = 6;
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
    print('right');
    _didSwipeRight = true;
    notifyListeners();
  }
}
