import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/fonts.dart';

// This widget is used to display some important messages in the middle of the screen. and is ready big.
class IconTextContainerBig extends StatelessWidget {
  const IconTextContainerBig({
    super.key,
    required this.icon,
    required this.text,
  });
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(icon),
        const SizedBox(
          width: 13,
        ),
        Text(
          text,
          style: const TextStyle(
              color: lilGreyColor, fontFamily: mainFont, fontSize: 20),
        )
      ],
    );
  }
}
