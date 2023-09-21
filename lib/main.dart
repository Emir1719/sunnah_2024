import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunnah_2024/locator.dart';
import 'package:sunnah_2024/pages/home.dart';

Future<void> main() async {
  final container = ProviderContainer();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]); //Yatay döndürmeyi kapatır
  setupLocator();
  runApp(
    ProviderScope(
      parent: container,
      child: const Home(),
    ),
  );
}
