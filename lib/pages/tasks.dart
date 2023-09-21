import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunnah_2024/riverpods/global_riverpods.dart';
import 'package:sunnah_2024/widgets/appbar.dart';
import 'package:sunnah_2024/widgets/task_item.dart';

///Görevlerin listelendiği sayfa.
class Tasks extends ConsumerWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //var taskList = ref.watch(displayAllTaskProvider.notifier).getTaskListOfIsland(1);
    var taskList = ref.watch(displayAllTaskProvider);

    return Scaffold(
      appBar: const ProjectAppBar(),
      body: ListView.separated(
        padding: const EdgeInsets.all(20).copyWith(left: 26),
        itemCount: taskList.length,
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemBuilder: (context, index) {
          return ProviderScope(
            overrides: [currentTaskProvider.overrideWithValue(taskList[index])],
            child: const TaskItem(),
          );
        },
      ),
    );
  }
}
