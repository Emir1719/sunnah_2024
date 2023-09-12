import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunnah_2024/constants/light_theme.dart';
import 'package:sunnah_2024/locator.dart';
import 'package:sunnah_2024/pages/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]); //Yatay döndürmeyi kapatır
  setupLocator();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sünnet Rehberi",
      debugShowCheckedModeBanner: false,
      theme: ThemeLight().theme(),
      //onGenerateRoute: AppRoute().generator,
      //initialRoute: AppPages.home,
      home: const Home(),
    );
  }
}
