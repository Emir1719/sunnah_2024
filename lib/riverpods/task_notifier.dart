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

  ///Listede bulunan ve option değeri always olan görevlerin sayısını döndürür.
  int countCompletedTask() {
    return state.where((element) => element.option == Option.completed).length;
  }

  ///Listede bulunan ve option değeri never olan görevlerin sayısını döndürür.
  int countUncompletedTask() {
    return state.where((element) => element.option == Option.uncompleted).length;
  }

  ///Görevlerin totaldeki tamamlanma yüzdesi. <br>
  ///10 görev. 8 always, 2 never ise 800/10 = %80 <br>
  ///10 görev. 6 always, 2 generally, 2 rarely ise (600 + 132 + 66) / 10 = %79,8
  double getCompletionPercentage() {
    return (countCompletedTask() * 100 + countUncompletedTask() * 0) / state.length;
  }
}
