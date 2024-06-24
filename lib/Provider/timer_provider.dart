import 'dart:async';
import 'package:flutter/material.dart';

class TimerProvider with ChangeNotifier {
  String? selectedCourse;
  static const int _defaultMaxSeconds = 3600;
  int maxSeconds = _defaultMaxSeconds;
  int seconds = _defaultMaxSeconds;
  Timer? timer;
  bool isPaused = false;
  bool hasStarted = false;
  VoidCallback? onTimerFinish;
  int currentImageIndex = 0;
  int currentImageLevel = 0;

  void updateCurrentImageIndex(int newIndex) {
    currentImageIndex = newIndex;
    notifyListeners();
  }

  void updateCurrentImageLevel(int newLevel) {
    currentImageLevel = newLevel;
    notifyListeners();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(microseconds: 1), (_) {
      if (!isPaused) {
        if (seconds > 0) {
          seconds--;
          hasStarted = true;
        } else {
          stopTimer(reset: true);
          if (onTimerFinish != null) {
            onTimerFinish!();
          }
        }
        notifyListeners();
      }
    });
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    timer?.cancel();
    hasStarted = false;
    notifyListeners();
  }

  void resetTimer() {
    seconds = maxSeconds;
    isPaused = false;
    hasStarted = false;
    notifyListeners();
  }
}