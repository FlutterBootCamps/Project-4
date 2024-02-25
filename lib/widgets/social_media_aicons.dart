import 'package:flutter/material.dart';

class SocialMedia extends StatelessWidget {
 SocialMedia({super.key , required this.icon});

  String icon;


  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: Image.asset(icon));
  }
}
