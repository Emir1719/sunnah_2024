import 'package:get/get.dart';
import 'package:sunnah_2024/models/task_model.dart';
import 'package:sunnah_2024/pages/task_detail.dart';
import 'package:sunnah_2024/sevices/sqlite_database.dart';

class TaskController extends GetxController {
  List<TaskModel> tasks = [];
  late Rx<TaskModel> currentTask;
  final _database = SQLiteDatabase();

  TaskController() {
    _init();
  }

  _init() async {
    await _database.getTasks().then((value) => tasks = value);
    currentTask = tasks.first.obs;
  }

  ///Seçilen öğrenciyi belirleyip [TaskDetail] sayfasına gider.
  void onTabTextItem(int index) {
    currentTask = tasks[index].obs;
    Get.to(const TaskDetail());
  }

  void onTabCompleteButton() {
    int i = currentTask.value.isComplete;
    if (i == 0) {
      currentTask.value.isComplete = 1;
    } else {
      currentTask.value.isComplete = 0;
    }
    update();
  }
}
