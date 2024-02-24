import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:project_4_alaa/constant/color.dart';
import 'package:project_4_alaa/helper/screen_helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: white,
                ),
                child: Image.asset("asset/image/person-outline.png"),
              ),
            ],
          ),
          const Column(
            children: [
              Text(
                "Profile settings",
                style: 
                TextStyle(
                  // GoogleFonts.getFont('Telegraf',
                    color: white, fontSize: 14, fontWeight: FontWeight.w400, 
                    ),
              ),
              Text(
                "Settings regarding your profile",
                style: TextStyle(
                //  GoogleFonts.getFont('Telegraf',
                color: white, fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Image.asset("asset/image/arrow_icon.png", width: context.getWidth() * 0.02,),
        ],
      ),
    );
  }
}
