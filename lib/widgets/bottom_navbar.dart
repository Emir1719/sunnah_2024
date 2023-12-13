import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunnah_2024/riverpods/global_riverpods.dart';

class AppBottomNavBar extends ConsumerWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(pageProvider);

    return BottomNavigationBar(
      onTap: (index) => ref.read(pageProvider.notifier).changePage(index),
      currentIndex: pageIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 30,
      selectedFontSize: 15,
      unselectedFontSize: 15,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ana Sayfa"),
        BottomNavigationBarItem(icon: Icon(Icons.question_answer_rounded), label: "Soru Cevap"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Ayarlar"),
      ],
    );
  }
}
