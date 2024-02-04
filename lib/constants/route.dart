import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunnah_2024/view/home_view.dart';
import 'package:sunnah_2024/view/islands.dart';
import 'package:sunnah_2024/view/task_detail.dart';
import 'package:sunnah_2024/view/tasks.dart';

class AppRoute {
  static const tasks = "/tasks";
  static const taskDetail = "/taskDetail";
  static const home = "/home";

  static final fragments = [
    const Islands(),
    Container(),
    Container(),
  ];

  static appRoutes() {
    Transition? transition = Transition.native;

    if (TargetPlatform.iOS == defaultTargetPlatform) {
      transition = Transition.cupertino;
    }

    return [
      GetPage(
        name: '/tasks',
        page: () => const Tasks(),
        transition: transition,
      ),
      GetPage(
        name: '/taskDetail',
        page: () => const TaskDetail(),
        transition: transition,
      ),
      GetPage(
        name: '/home',
        page: () => const HomeView(),
        transition: transition,
      ),
    ];
  }
}
