import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sunnah_2024/constants/light_theme.dart';
import 'package:sunnah_2024/riverpods/global_riverpods.dart';
import 'package:sunnah_2024/route/pages.dart';
import 'package:sunnah_2024/widgets/appbar.dart';
import 'package:sunnah_2024/widgets/bottom_navbar.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPageIndex = ref.watch(pageProvider);

    return GetMaterialApp(
      title: "Sünnet Rehberi",
      debugShowCheckedModeBanner: false,
      theme: ThemeLight().theme(),
      home: Scaffold(
        appBar: const ProjectAppBar(),
        body: SafeArea(
          child: IndexedStack(
            index: selectedPageIndex,
            children: AppPages.pages,
          ),
        ),
        bottomNavigationBar: const AppBottomNavBar(),
      ),
    );
  }
}
