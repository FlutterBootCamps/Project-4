import 'package:flutter/material.dart';


class SavedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111111),
      appBar: AppBar(
        backgroundColor: Color(0xff111111),
        title: Text('Saved News',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Center(
        child: Text('No news found',style: TextStyle(fontSize: 16,color: Color(0xffB8B8B8)),),
      ),
       
    );
  }
}