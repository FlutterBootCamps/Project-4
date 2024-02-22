import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: bgColor,
      body: Center(child: Text("This is Saved Page", style: TextStyle(color: whiteColor),)),
    );
  }
}