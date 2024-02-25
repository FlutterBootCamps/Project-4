import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(24),
            height: 44,
            width: 343,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[850],
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search for News',
                hintStyle: TextStyle(color: Color(0xffB8B8B8)),
                prefixIcon: Image.asset(
                    'assets/d.png'), // Icon on the left side of the text field
              ),
            ),
          ),
        ],
      ),
    );
  }
}
