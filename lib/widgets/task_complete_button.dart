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
    var controller = Get.put(TaskController());
    final style = locator<ProjectStyle>();

    return Obx(
      () => AppButton(
        label: controller.currentTask.value.isComplete == 0 ? "Görevi Tamamla" : "Vazgeç",
        style: style.videoButton(controller.currentTask.value.isComplete),
        icon: controller.currentTask.value.isComplete == 0 ? Icons.task_alt : Icons.cancel_outlined,
        onPressed: controller.onTabCompleteButton,
      ),
    );
  }
}
