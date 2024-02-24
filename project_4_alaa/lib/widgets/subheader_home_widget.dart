import 'package:flutter/material.dart';
import 'package:project_4_alaa/constant/color.dart';

class subtitle extends StatelessWidget {
  const subtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Top Stories",
          style: TextStyle(
              color: white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        Text(
          "See all",
          style:
              TextStyle(color: grey, fontSize: 16, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
