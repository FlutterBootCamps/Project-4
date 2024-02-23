import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/fonts.dart';

// This widget is used to display some important messages in the middle of the screen.
class IconTextContainer extends StatelessWidget {
  const IconTextContainer({
    super.key,
    required this.icon,
    required this.text,
  });

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.asset(icon),
        const SizedBox(
          width: 6,
        ),
        Text(
          text.toUpperCase(),
          style: const TextStyle(
              color: warmPurpleColor,
              fontFamily: mainFont,
              fontSize: 14,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
