import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunnah_2024/constants/style.dart';
import 'package:sunnah_2024/locator.dart';
import 'package:sunnah_2024/route/pages.dart';

class ProjectAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ProjectAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = locator<ProjectStyle>();
    String appbarName = ref.watch(appBarNameProvider);

    return AppBar(title: Text(appbarName, style: style.appbarTitle));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
