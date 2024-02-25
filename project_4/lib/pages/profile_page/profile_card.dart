
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_4/helper/extintion.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {super.key,
      required this.title,
      required this.supTitle,
      required this.image});
  final String title;
  final String supTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: context.getWidth() / 6,
          width: context.getWidth() / 6,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Image.asset(
            image,
            fit: BoxFit.scaleDown,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: context.getWidth() / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              Text(
                supTitle,
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: context.getWidth() / 6,
          child: const Icon(
            Icons.arrow_circle_right_outlined,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
