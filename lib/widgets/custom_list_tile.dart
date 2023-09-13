import 'package:flutter/material.dart';
import 'package:sunnah_2024/pages/home.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({super.key, required this.logo});
  final int logo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: logo % 2 == 1 ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          Container(
            width: 180,
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset("assets/images/islands/$logo.png"),
                ),
                Text(
                  "Ada $logo",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
