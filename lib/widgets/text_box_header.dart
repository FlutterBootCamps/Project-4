import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/fonts.dart';
import 'package:news_app/widgets/text_box_field.dart';

class TextBoxHeader extends StatelessWidget {
  const TextBoxHeader({
    super.key, required this.title, this.controller, required this.maxLines, this.prefixIcon, this.hintText,
  });
  final String title;
  final TextEditingController? controller;
  final int maxLines;
  final Widget? prefixIcon;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 1),
          child: Text(title, style: const TextStyle(color: whiteColor, fontFamily: mainFont, fontSize: 17, fontWeight: FontWeight.bold),),
        ),
        const SizedBox(height: 5,),
        TextBoxField(controller: controller, maxLines: maxLines, prefixIcon: prefixIcon, hintText: "Enter a ${title.toLowerCase()}",),
      ],
    );
  }
}

