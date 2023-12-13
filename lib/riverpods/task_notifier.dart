import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunnah_2024/models/task_model.dart';
import 'package:sunnah_2024/sevices/sqlite_database.dart';

class TaskNotifier extends StateNotifier<List<TaskModel>> {
  TaskNotifier() : super([]) {
    //Jsondaki veriyi buraya aktarır.
    SQLiteDatabase().getTasks().then((value) => state = value);
    //TaskService().getTasksLocal().then((value) => state = value);
  }

  void toggle(String id, int isComplete) {}
}
