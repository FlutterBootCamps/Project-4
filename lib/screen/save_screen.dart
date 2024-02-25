import 'package:flutter/material.dart';
import 'package:project4/widgets/text_widgets.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Color(0xff121212),
      body: ListView(children: [Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextWidget(text: 'Save News', size:20 ),
       ), 
      ],),
    );
  }
}