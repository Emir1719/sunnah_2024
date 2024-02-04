import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sunnah_2024/locator.dart';
import 'package:sunnah_2024/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]); //Yatay döndürmeyi kapatır
  setupLocator();
  runApp(const Home());
}
