import 'package:flutter/material.dart';

class ProjectColor {
  final primary = const Color(0xff24855B); //mettalicGreen
  final secondary = Colors.green; //progress
  final background = const Color(0xffF8F9FA); //white

  ///primary rengi Color'dan MaterialColor'a çevrildi.
  MaterialColor appGreen = const MaterialColor(0xff24855B, {
    50: Color(0xff24855B),
    100: Color(0xff24855B),
    200: Color(0xff24855B),
    300: Color(0xff24855B),
    400: Color(0xff24855B),
    500: Color(0xff24855B),
    600: Color(0xff24855B),
    700: Color(0xff24855B),
    800: Color(0xff24855B),
    900: Color(0xff24855B),
  });
}
