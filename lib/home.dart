import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sunnah_2024/constants/light_theme.dart';
import 'package:sunnah_2024/constants/route.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Sünnet Rehberi",
      debugShowCheckedModeBanner: false,
      theme: ThemeLight().theme(),
      getPages: AppRoute.appRoutes(),
      initialRoute: AppRoute.home,
    );
  }
}
