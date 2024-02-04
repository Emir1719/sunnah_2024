import 'package:flutter/material.dart';
import 'package:sunnah_2024/widgets/islands_grid.dart';
import 'package:sunnah_2024/widgets/percent.dart';

///Adaların ve yüzdenin görüntülendiği sayfa.
class Islands extends StatelessWidget {
  const Islands({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Percent(),
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            reverse: false,
            crossAxisCount: 2,
            children: [
              for (int i = 1; i <= 6; i++) IslandGridview(id: i),
            ],
          ),
        ),
      ],
    );
  }
}
