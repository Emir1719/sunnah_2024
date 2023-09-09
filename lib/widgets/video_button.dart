import 'package:flutter/material.dart';
import 'package:sunnah_2024/constants/style.dart';
import 'package:sunnah_2024/locator.dart';

///Video başlığının altında bulunan özelleştirilmiş butonlar.
class VideoButton extends StatefulWidget {
  const VideoButton({super.key, required this.label, required this.icon, required this.onPressed});
  final String label;
  final IconData? icon;
  final void Function() onPressed;

  @override
  State<VideoButton> createState() => _VideoButtonState();
}

class _VideoButtonState extends State<VideoButton> {
  final style = locator<ProjectStyle>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: widget.onPressed,
      style: style.videoButton,
      icon: Icon(widget.icon, size: 22),
      label: Text(widget.label, style: style.videoButtonTitle),
    );
  }
}
