import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunnah_2024/constants/style.dart';
import 'package:sunnah_2024/locator.dart';
import 'package:sunnah_2024/models/option.dart';
import 'package:sunnah_2024/models/task_model.dart';
import 'package:sunnah_2024/riverpods/global_riverpods.dart';
import 'package:sunnah_2024/riverpods/task_notifier.dart';
import 'package:sunnah_2024/widgets/appbar.dart';
import 'package:sunnah_2024/widgets/app_button.dart';

///Seçilen görevin açıklamasının olduğu sayfa.
class TaskDetail extends ConsumerWidget {
  const TaskDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var task = ref.watch(currentTaskProvider);
    var allTask = ref.watch(displayAllTaskProvider.notifier);
    var style = locator<ProjectStyle>();

    return Scaffold(
      appBar: const ProjectAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    task.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: style.videoTitleText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    task.description,
                    style: style.videoDescriptionText,
                  ),
                ),
                AppButton(
                  label: task.option == Option.uncompleted ? "Görevi Tamamla" : "Vazgeç",
                  style: style.videoButton(task.option),
                  icon: task.option == Option.uncompleted ? Icons.task_alt : Icons.cancel_outlined,
                  onPressed: () => submit(task, ref, allTask, context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///Tamamlanmayan görevi tamamlar, tamamlanan görevi ise geri alır. Yüzde değerini günceller.
  void submit(TaskModel task, WidgetRef ref, TaskNotifier allTask, BuildContext context) {
    if (task.option == Option.uncompleted) {
      ref.read(displayAllTaskProvider.notifier).edit(task.id, Option.completed);
    } else {
      ref.read(displayAllTaskProvider.notifier).edit(task.id, Option.uncompleted);
    }
    ref.read(taskPercentProvider.notifier).chance(allTask.getCompletionPercentage());
    Navigator.pop(context);
  }
}
