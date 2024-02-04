import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunnah_2024/constants/style.dart';
import 'package:sunnah_2024/controller/task_controller.dart';
import 'package:sunnah_2024/locator.dart';
import 'package:sunnah_2024/widgets/app_button.dart';

class TaskCompleteButton extends StatelessWidget {
  const TaskCompleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final style = locator<ProjectStyle>();

    return GetBuilder<TaskController>(
      builder: (controller) {
        return AppButton(
          label: controller.getButtonName(),
          style: style.videoButton(controller.currentTask.value.isComplete),
          icon: controller.currentTask.value.isComplete == 0 ? Icons.task_alt : Icons.cancel_outlined,
          onPressed: () {
            controller.onTabCompleteButton();
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
