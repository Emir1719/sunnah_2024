import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageState extends StateNotifier<int> {
  PageState() : super(0);

  void changePage(int pageIndex) {
    try {
      if (pageIndex >= 0 || pageIndex == state) {
        //Eğer aynı sayfaya gitmek istenirse yapma.
        state = pageIndex;
      }
    } catch (_) {}
  }
}
