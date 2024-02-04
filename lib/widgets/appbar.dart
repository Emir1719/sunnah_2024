import 'package:flutter/material.dart';
import 'package:sunnah_2024/constants/style.dart';
import 'package:sunnah_2024/locator.dart';

class ProjectAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProjectAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final style = locator<ProjectStyle>();
    //String appbarName = ref.watch(appBarNameProvider);

    return AppBar(title: Text("Sünnet Rehberi", style: style.appbarTitle));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
