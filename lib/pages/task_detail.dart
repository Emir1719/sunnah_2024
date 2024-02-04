import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunnah_2024/constants/style.dart';
import 'package:sunnah_2024/controller/task_controller.dart';
import 'package:sunnah_2024/locator.dart';
import 'package:sunnah_2024/widgets/appbar.dart';
import 'package:sunnah_2024/widgets/task_complete_button.dart';

///Seçilen görevin açıklamasının olduğu sayfa.
class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TaskController());
    var style = locator<ProjectStyle>();
    const space = SizedBox(height: 20);

    return Scaffold(
      appBar: const ProjectAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.currentTask.value.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: style.videoTitleText,
                ),
                space,
                Text(
                  controller.currentTask.value.description,
                  style: style.videoDescriptionText,
                ),
                space,
                const TaskCompleteButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
