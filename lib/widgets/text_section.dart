import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/fonts.dart';

// This is a widget that has a header, and some text below it, it is used in the ArticleDetailsPage.
class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.title,
    required this.text,
  });
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: whiteColor,
              fontFamily: mainFont,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 14,
        ),
        Text(
          text,
          style: const TextStyle(
              color: lilGreyColor,
              fontFamily: mainFont,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
