import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunnah_2024/controller/task_controller.dart';
import 'package:sunnah_2024/widgets/appbar.dart';
import 'package:sunnah_2024/widgets/task_item.dart';

///Görevlerin listelendiği sayfa.
class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TaskController());

    return Scaffold(
      appBar: const ProjectAppBar(),
      body: FutureBuilder(
        future: controller.database.getTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const Text('No data available');
          }

          controller.tasks = snapshot.data!;
          return ListView.separated(
            padding: const EdgeInsets.all(20).copyWith(left: 26),
            itemCount: controller.tasks.length,
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemBuilder: (context, index) {
              controller.setCurrentTask(index);
              return TaskItem(index: index);
            },
          );
        },
      ),
    );
  }
}
