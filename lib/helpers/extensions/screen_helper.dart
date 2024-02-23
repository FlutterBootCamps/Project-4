import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';

extension Screen on BuildContext{

  double getWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  double getHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  push(BuildContext context, Widget view){
    return Navigator.push(context, MaterialPageRoute(builder: (route) => view));
  }

  void showSnackBar(BuildContext context,String message, Color color){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message, style: const TextStyle(color: whiteColor),), backgroundColor: color,));
  }
}