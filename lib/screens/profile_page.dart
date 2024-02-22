import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: bgColor,
      body: Center(child: Text("This is Profile Page", style: TextStyle(color: whiteColor),)),
    );
  }
}