import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: bgColor,
      body: Center(child: Text("This is Explore Page", style: TextStyle(color: whiteColor),)),
    );
  }
}