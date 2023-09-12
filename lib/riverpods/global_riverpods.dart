import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunnah_2024/models/task_model.dart';
import 'package:sunnah_2024/riverpods/task_notifier.dart';
import 'package:sunnah_2024/riverpods/task_percent.dart';
import 'package:sunnah_2024/sevices/task_service.dart';

///Bütün görevlerin listesini döndürür.
final displayAllTaskProvider = StateNotifierProvider<TaskNotifier, List<TaskModel>>((ref) {
  return TaskNotifier();
});

///Ana sayfada override edileceğinden dolayı içindeki ifadenin önemi yok.
///Eğer override edilmeden kullanılırsa hata veriyor.
final currentTaskProvider = Provider<TaskModel>((ref) {
  throw UnimplementedError();
});

///Görevlerin yüzdesi.
final taskPercentProvider = StateNotifierProvider<TaskPercentNotifier, double>((ref) {
  return TaskPercentNotifier();
});

///Servise giderek jsondaki veriyi liste olarak döndürür.
final getTasksProvider = FutureProvider<List>((ref) async {
  final service = TaskService();
  return service.getTasksLocal();
});

/*final taskButtonNameProvider = Provider<String>((ref) {
  final task = ref.read(currentTaskProvider);
  if (task.option == Option.uncompleted) {
    return "Görevi Tamamla";
  }
  return "Vazgeç";
});*/
