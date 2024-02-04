import 'package:get/get.dart';
import 'package:sunnah_2024/models/task_model.dart';
import 'package:sunnah_2024/pages/task_detail.dart';
import 'package:sunnah_2024/sevices/sqlite_database.dart';

class TaskController extends GetxController {
  List<TaskModel> tasks = [];
  late Rx<TaskModel> currentTask;
  final database = SQLiteDatabase();

  TaskController() {
    _init();
  }

  _init() async {
    tasks = await database.getTasks();
    currentTask = tasks.first.obs;
  }

  void setCurrentTask(int i) {
    currentTask = tasks[i].obs;
  }

  ///Seçilen öğrenciyi belirleyip [TaskDetail] sayfasına gider.
  void onTabTextItem(int index) {
    setCurrentTask(index);
    Get.to(const TaskDetail());
  }

  void onTabCompleteButton() async {
    int i = currentTask.value.isComplete;
    if (i == 0) {
      currentTask.value.isComplete = 1;
    } else {
      currentTask.value.isComplete = 0;
    }
    await database.updateTask(currentTask.value);
    update();
  }

  String getButtonName() {
    return currentTask.value.isComplete == 0 ? "Görevi Tamamla" : "Vazgeç";
  }

  double getPercent() {
    var complete = 0;
    for (var element in tasks) {
      if (element.isComplete == 1) {
        complete++;
      }
    }
    if (complete == 0 || tasks.isEmpty) {
      return 0.0; // Return 0 if there are no tasks or no completed tasks
    }
    return (complete / tasks.length) * 100;
  }
}
