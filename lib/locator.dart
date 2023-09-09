import 'package:get_it/get_it.dart';
import 'package:sunnah_2024/constants/color.dart';
import 'package:sunnah_2024/constants/style.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ProjectColor());
  locator.registerLazySingleton(() => ProjectStyle());
}
