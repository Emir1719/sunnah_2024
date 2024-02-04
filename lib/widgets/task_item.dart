// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunnah_2024/constants/style.dart';
import 'package:sunnah_2024/controller/task_controller.dart';
import 'package:sunnah_2024/locator.dart';

///Yeşil/Kırmızı renk - Sünnet bulunduran bir yapı.
class TaskItem extends StatelessWidget {
  const TaskItem({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final style = locator<ProjectStyle>();

    return GetBuilder<TaskController>(
      builder: (controller) {
        controller.setCurrentTask(index);
        return Container(
          decoration: style.taskContainer(controller.currentTask.value.isComplete),
          child: ListTile(
            onTap: () => controller.onTabTextItem(index),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            title: Text(
              controller.currentTask.value.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: style.taskTitle,
            ),
          ),
        );
      },
    );
  }
}
