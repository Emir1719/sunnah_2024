import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunnah_2024/constants/color.dart';
import 'package:sunnah_2024/constants/style.dart';
import 'package:sunnah_2024/locator.dart';
import 'package:sunnah_2024/riverpods/global_riverpods.dart';

class Percent extends ConsumerWidget {
  const Percent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var color = locator<ProjectColor>();
    var style = locator<ProjectStyle>();
    double percent = ref.watch(taskPercentProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: LinearProgressIndicator(
                value: percent / 100,
                minHeight: 15,
                color: color.green,
                backgroundColor: color.green.shade200,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              '${percent.toStringAsFixed(2)}%',
              style: style.percentValue,
            ),
          ),
        ],
      ),
    );
  }
}
