// ignore_for_file: avoid_print
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskPercentNotifier extends StateNotifier<double> {
  TaskPercentNotifier() : super(0.0);

  void chance(double value) {
    try {
      if (value >= 0 && value <= 100) {
        state = value;
      }
    } catch (e) {
      print("TaskPercentNotifier'de hata çıktı: $e");
    }
  }
}
