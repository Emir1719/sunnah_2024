import 'package:flutter/material.dart';
import 'package:sunnah_2024/widgets/video_button.dart';

class ComeBackButton extends StatefulWidget {
  const ComeBackButton({super.key});

  @override
  State<ComeBackButton> createState() => _ComeBackButtonState();
}

class _ComeBackButtonState extends State<ComeBackButton> {
  @override
  Widget build(BuildContext context) {
    return VideoButton(
      label: "Geri Dön",
      icon: Icons.arrow_back_ios_new,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
