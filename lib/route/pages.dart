
/*
class AppPages {
  /*static const String home = "/home";
  static const String taskDetail = "/taskDetail";*/

  static final pages = [
    const Islands(),
    Container(),
    Container(),
  ];
}

final appBarNameProvider = Provider<String>((ref) {
  //final pageIndex = ref.watch(pageProvider);
  String name = "Sünnet Rehberi";
  if (pageIndex == 0) {
    name = "Sünnet Rehberi";
  } else if (pageIndex == 1) {
    name = "Soru Cevap";
  } else if (pageIndex == 2) {
    name = "Ayarlar";
  }
  return name;
});
*/