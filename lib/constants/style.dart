import 'package:flutter/material.dart';
import 'package:sunnah_2024/constants/color.dart';
import 'package:sunnah_2024/models/option.dart';

class ProjectStyle {
  TextStyle baseTextStyle = const TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontFamily: "Roboto",
  );
  late TextStyle percentValue;
  late TextStyle videoTitleText;
  late TextStyle videoDescriptionText;
  late TextStyle taskTitle;
  late TextStyle dropdownTitle;
  late TextStyle appbarTitle;
  late TextStyle videoButtonTitle;

  BoxDecoration baseBoxStyle = BoxDecoration(
    border: Border.all(color: Colors.grey),
  );
  late BoxDecoration videoTitle;
  late BoxDecoration taskDropdownButton;

  ProjectStyle() {
    //TextStyles:
    percentValue = baseTextStyle.copyWith(
      fontSize: 18,
    );
    videoTitleText = baseTextStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );
    videoDescriptionText = baseTextStyle.copyWith(
      fontSize: 18,
      height: 1.5,
    );
    taskTitle = baseTextStyle.copyWith(
      fontSize: 18,
    );
    dropdownTitle = baseTextStyle.copyWith();
    appbarTitle = baseTextStyle.copyWith(
      fontSize: 20,
      color: Colors.white,
    );
    videoButtonTitle = baseTextStyle.copyWith(
      fontSize: 18,
      color: ProjectColor().appGreen,
    );

    //BoxDecorations:

    ///Video başlığının ve butonların bulunduğu kısmın stili.
    videoTitle = baseBoxStyle.copyWith(
      border: const Border(
        bottom: BorderSide(width: 0.5, color: Colors.grey),
      ),
    );
    taskDropdownButton = baseBoxStyle.copyWith(
      border: Border.all(width: 0.5, color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    );
  }

  BoxDecoration taskContainer(Option option) {
    var color = Colors.red;

    switch (option) {
      case Option.completed:
        color = Colors.green;
        break;
      default:
        color = Colors.red;
    }

    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: [
        BoxShadow(color: color, offset: const Offset(-6, 0)),
        BoxShadow(color: Colors.grey.shade300, offset: const Offset(0, 2), blurRadius: 5),
      ],
    );
  }

  ButtonStyle videoButton(Option option) {
    var color = option == Option.uncompleted ? ProjectColor().primary : Colors.red;
    videoButtonTitle = baseTextStyle.copyWith(fontSize: 18, color: color);
    return ElevatedButton.styleFrom(
      fixedSize: const Size.fromHeight(40),
      backgroundColor: Colors.transparent,
      foregroundColor: color,
      shadowColor: Colors.transparent,
      side: BorderSide(width: 1, color: color),
      textStyle: TextStyle(fontSize: 15, color: color),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
