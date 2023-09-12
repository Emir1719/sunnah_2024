import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunnah_2024/models/option.dart';
import 'package:sunnah_2024/models/task_model.dart';
import 'package:sunnah_2024/sevices/task_service.dart';

class TaskNotifier extends StateNotifier<List<TaskModel>> {
  TaskNotifier() : super([]) {
    //Jsondaki veriyi buraya aktarır.
    TaskService().getTasksLocal().then((value) => state = value);
  }

  ///Verilen id değerine sahip görevin [option] özelliğini değiştirir.
  ///Diğer özellikler sabit kalır.
  void edit(String id, Option option) {
    state = [
      for (var task in state)
        if (id == task.id)
          TaskModel(id: id, title: task.title, description: task.description, link: task.link, option: option)
        else
          task
    ];
  }

  ///Listede bulunan ve option değeri completed olan görevlerin sayısını döndürür.
  int countCompletedTask() {
    return state.where((element) => element.option == Option.completed).length;
  }

  ///Listede bulunan ve option değeri uncompleted olan görevlerin sayısını döndürür.
  int countUncompletedTask() {
    return state.where((element) => element.option == Option.uncompleted).length;
  }

  ///Görevlerin totaldeki tamamlanma yüzdesi.
  double getCompletionPercentage() {
    return (countCompletedTask() * 100 + countUncompletedTask() * 0) / state.length;
  }
}
