import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/fonts.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    super.key, required this.headerText, this.seeAllOnTap,
  });
  final String headerText;
  final Function()? seeAllOnTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(headerText, style: const TextStyle(color: whiteColor, fontFamily: mainFont, fontSize: 16, fontWeight: FontWeight.bold),),
          InkWell(onTap: seeAllOnTap, child: const Text("See All", style: TextStyle(color: textInactiveColorTabBar, fontFamily: mainFont, fontSize: 12, fontWeight: FontWeight.w600),)), // used instead of TextButton since it dosen't have default irremovable padding.
        ],
      ),
    );
  }
}