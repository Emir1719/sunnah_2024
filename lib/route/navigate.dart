import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunnah_2024/models/task_model.dart';
import 'package:sunnah_2024/riverpods/global_riverpods.dart';

class AppNavigate {
  ///[page]'e gider.
  static dynamic navigate(BuildContext context, Widget page) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => page),
    );
  }

  ///[page]'e currentTaskProvider'i override ederek gider.
  static dynamic navigateWithOverride(BuildContext context, Widget page, TaskModel taskModel) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => ProviderScope(
          overrides: [
            currentTaskProvider.overrideWithValue(taskModel),
          ],
          child: page,
        ),
      ),
    );
  }
}
