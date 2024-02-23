import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/fonts.dart';

// This widget helps show info in a card that navigates to another screen, it is used in the ProfileScreen
class GoToCard extends StatelessWidget {
  const GoToCard({
    super.key,
    required this.icon,
    required this.topText,
    required this.bottomText,
    this.onTap,
  });
  final String icon;
  final String topText;
  final String bottomText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                    image: AssetImage("assets/icons/person_black.png"))),
          ),
          const SizedBox(
            width: 16,
          ),
          SizedBox(
            width: 196,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topText,
                  style: const TextStyle(
                    color: whiteColor,
                    fontFamily: secondaryFont,
                    fontSize: 14,
                  ),
                ),
                Text(
                  bottomText,
                  style: const TextStyle(
                    color: whiteColor,
                    fontFamily: secondaryFont,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 54,
          ),
          Image.asset("assets/icons/arrow_circle_right.png"),
        ],
      ),
    );
  }
}
