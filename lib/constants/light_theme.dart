import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sunnah_2024/constants/color.dart';
import 'package:sunnah_2024/locator.dart';

class ThemeLight {
  final _color = locator<ProjectColor>();

  ThemeData theme() {
    return ThemeData(
      fontFamily: "Roboto",
      scaffoldBackgroundColor: _color.white,
      primarySwatch: _color.appGreen,
      appBarTheme: _appBarTheme(),
    );
  }

  AppBarTheme _appBarTheme() {
    return AppBarTheme(
      centerTitle: true,
      elevation: 2,
      color: _color.mettalicGreen,
      titleTextStyle: const TextStyle(fontSize: 20),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: _color.mettalicGreen,
        statusBarIconBrightness: Brightness.light, //for android light icon
        statusBarBrightness: Brightness.dark, //for ios light icon
      ),
    );
  }
}
