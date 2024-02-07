import 'package:get/get.dart';
import 'package:sunnah_2024/constants/route.dart';
import 'package:sunnah_2024/models/task_model.dart';
import 'package:sunnah_2024/view/task_detail.dart';
import 'package:sunnah_2024/sevices/sqlite_database.dart';

class TaskController extends GetxController {
  List<TaskModel> tasks = [];
  late Rx<TaskModel> currentTask;
  final database = SQLiteDatabase();
  var percent = 0.0.obs;
  var id = 1;

  TaskController() {
    _init();
    getPercent();
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
    Get.toNamed(AppRoute.taskDetail);
  }

  void onTabCompleteButton() async {
    int i = currentTask.value.isComplete;
    if (i == 0) {
      currentTask.value.isComplete = 1;
    } else {
      currentTask.value.isComplete = 0;
    }
    await database.updateTask(currentTask.value);
    await getPercent();
    update();
  }

  String getButtonName() {
    return currentTask.value.isComplete == 0 ? "Görevi Tamamla" : "Vazgeç";
  }

  Future<void> getPercent() async {
    percent.value = await database.getPercent();
  }
}
