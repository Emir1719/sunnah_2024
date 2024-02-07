import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunnah_2024/constants/color.dart';
import 'package:sunnah_2024/constants/style.dart';
import 'package:sunnah_2024/controller/task_controller.dart';
import 'package:sunnah_2024/locator.dart';

class Percent extends StatelessWidget {
  const Percent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = locator<ProjectColor>();
    var style = locator<ProjectStyle>();
    var controller = Get.put(TaskController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Obx(
        () => Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: LinearProgressIndicator(
                  value: controller.percent.value / 100,
                  minHeight: 15,
                  color: color.secondary,
                  backgroundColor: color.secondary.shade200,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                '${controller.percent.value.toStringAsFixed(2)}%',
                style: style.percentValue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
