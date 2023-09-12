import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunnah_2024/constants/style.dart';
import 'package:sunnah_2024/locator.dart';
import 'package:sunnah_2024/models/task_model.dart';
import 'package:sunnah_2024/pages/task_detail.dart';
import 'package:sunnah_2024/riverpods/global_riverpods.dart';

///İnfo - Sünnet - Dropdownbutton bulunduran bir yapı.
class TaskItem extends ConsumerWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = locator<ProjectStyle>();
    var task = ref.watch(currentTaskProvider);

    return Container(
      decoration: style.taskContainer(task.option),
      child: GestureDetector(
        onTap: () => onTab(context, task),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          title: Text(
            task.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: style.taskTitle,
          ),
        ),
      ),
    );
  }

  void onTab(BuildContext context, TaskModel taskModel) {
    //Navigator.pushNamed(context, AppPages.taskDetail);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProviderScope(
          overrides: [currentTaskProvider.overrideWithValue(taskModel)],
          child: const TaskDetail(),
        ),
      ),
    );
  }
}
