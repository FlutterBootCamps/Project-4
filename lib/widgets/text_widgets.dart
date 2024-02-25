import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key, required this.text, required this.size,
  });
  final String text;
final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
          color: Color(0xffE8E8E8),
          fontSize: size,
          fontWeight: FontWeight.bold),
    );
  }
}