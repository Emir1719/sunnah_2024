import 'package:flutter/material.dart';
import 'package:sunnah_2024/constants/route.dart';
import 'package:sunnah_2024/widgets/appbar.dart';
import 'package:sunnah_2024/widgets/bottom_navbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProjectAppBar(),
      body: SafeArea(
        child: IndexedStack(
          index: 0,
          children: AppRoute.fragments,
        ),
      ),
      //bottomNavigationBar: const AppBottomNavBar(),
    );
  }
}
