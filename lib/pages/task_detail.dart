import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunnah_2024/constants/style.dart';
import 'package:sunnah_2024/locator.dart';
import 'package:sunnah_2024/riverpods/global_riverpods.dart';
import 'package:sunnah_2024/widgets/come_back_button.dart';
import 'package:sunnah_2024/widgets/video_button.dart';

///Video player'ın bulunduğu alan.
class TaskDetail extends ConsumerWidget {
  const TaskDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var task = ref.watch(currentTaskProvider);
    var style = locator<ProjectStyle>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Sünnet Rehberi", style: style.appbarTitle)),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    task.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: style.videoTitleText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    task.description,
                    style: style.videoDescriptionText,
                  ),
                ),
                //const ComeBackButton(),
                VideoButton(
                  label: "Görevi Tamamla",
                  icon: Icons.task_alt,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
