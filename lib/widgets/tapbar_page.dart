import 'package:flutter/material.dart';

class TapbarPage extends StatelessWidget {
  const TapbarPage({
    super.key, required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'This $name Page',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}