import 'package:flutter/material.dart';
import 'package:sunnah_2024/constants/style.dart';
import 'package:sunnah_2024/locator.dart';

///Video başlığının altında bulunan özelleştirilmiş butonlar.
class AppButton extends StatefulWidget {
  const AppButton({super.key, required this.label, required this.icon, required this.onPressed, this.style});
  final String label;
  final IconData? icon;
  final void Function() onPressed;
  final ButtonStyle? style;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  final style = locator<ProjectStyle>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: widget.onPressed,
      style: widget.style,
      icon: Icon(widget.icon, size: 22),
      label: Text(widget.label, style: style.videoButtonTitle),
    );
  }
}
