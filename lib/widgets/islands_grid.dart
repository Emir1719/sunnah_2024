import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunnah_2024/pages/tasks.dart';
import 'package:sunnah_2024/riverpods/global_riverpods.dart';
import 'package:sunnah_2024/route/navigate.dart';

class IslandGridview extends ConsumerWidget {
  const IslandGridview({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(currentCategoryProvider.notifier).state = id;
        AppNavigate.navigate(context, const Tasks());
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/islands/${id.toString()}.png",
            width: MediaQuery.of(context).size.width * 0.4,
          ),
          Text(
            "Ada ${id.toString()}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
