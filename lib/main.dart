import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:games_app/Screens/nav_bottom.dart';

import 'package:games_app/bloc/new_news_bloc.dart';


// import 'package:games_app/Screens/game_store_page.dart';
// import 'package:games_app/Screens/nav_bottom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  BlocProvider(
      
      
      
      create: (context) => NewNewsBloc(),
      child: const MaterialApp(
      debugShowCheckedModeBanner: false,
        home: NavBottom(),
      ),
    );
  }
}
