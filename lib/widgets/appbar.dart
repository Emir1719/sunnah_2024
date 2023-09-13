import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunnah_2024/constants/style.dart';
import 'package:sunnah_2024/locator.dart';

class ProjectAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ProjectAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = locator<ProjectStyle>();

    return AppBar(title: Text("Sünnet Rehberi", style: style.appbarTitle));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
