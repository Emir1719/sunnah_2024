import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunnah_2024/constants/route.dart';
import 'package:sunnah_2024/controller/task_controller.dart';

class IslandGridview extends StatelessWidget {
  const IslandGridview({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    final cont = Get.put(TaskController());

    return InkWell(
      onTap: () {
        cont.id = id;
        Get.toNamed(AppRoute.tasks);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/islands/${id.toString()}.png",
            width: MediaQuery.of(context).size.width * 0.4,
          ),
          Text(
            "Ada ${id.toString()}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
