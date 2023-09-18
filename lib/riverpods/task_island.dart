// ignore_for_file: avoid_print
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunnah_2024/models/task_model.dart';
import 'package:sunnah_2024/riverpods/global_riverpods.dart';

class TaskIslandNotifier extends StateNotifier<List<TaskModel>> {
  TaskIslandNotifier(super.state);

  void getList(List<TaskModel> tasks, WidgetRef ref) {
    try {
      ref.watch(displayAllTaskProvider.notifier).getTaskListOfIsland(1);
      state = tasks;
    } catch (e) {
      print("TaskIslandNotifier'de hata çıktı.");
    }
  }
}
