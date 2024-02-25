import 'package:flutter/material.dart';

class ContainerGreyBox extends StatelessWidget {
  const ContainerGreyBox({
    super.key, required this.text, required this.color,
  });
final String text;
final Color color; 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.grey[800],),
      child: Text(text,style: TextStyle(fontSize: 14,color: color),),
    );
  }
}