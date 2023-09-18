import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunnah_2024/widgets/appbar.dart';
import 'package:sunnah_2024/widgets/islands_grid.dart';
import 'package:sunnah_2024/widgets/percent.dart';

///Adaların ve yüzdenin görüntülendiği sayfa.
class Islands extends ConsumerWidget {
  const Islands({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const ProjectAppBar(),
      body: SafeArea(
        child: Column(
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
        ),
      ),
    );
  }
}
