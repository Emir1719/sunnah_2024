import 'package:flutter/material.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    const pageIndex = 0;

    return BottomNavigationBar(
      onTap: (index) {},
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
