import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/fonts.dart';

// This is the main textbox field used within the application, it's very verstile as it can incude a prefix icon, or none, amongst other things.
class TextBoxField extends StatelessWidget {
  const TextBoxField({
    super.key,
    required this.controller,
    required this.maxLines,
    required this.prefixIcon,
    required this.hintText,
    this.onChanged,
  });

  final TextEditingController? controller;
  final int maxLines;
  final Widget? prefixIcon;
  final String? hintText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      minLines: 1,
      maxLines: maxLines,
      style: const TextStyle(
          color: whiteColor, fontFamily: mainFont, fontSize: 14),
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          contentPadding: const EdgeInsets.all(12),
          hintText: hintText,
          hintStyle: const TextStyle(
              color: dotInactiveColor,
              fontFamily: mainFont,
              fontSize: 14,
              fontWeight: FontWeight.w500),
          filled: true,
          fillColor: darkGreyColor,
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
    );
  }
}
