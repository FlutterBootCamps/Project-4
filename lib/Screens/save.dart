import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:games_app/bloc/new_news_bloc.dart';
import 'package:games_app/models/news_data.dart';
import 'package:games_app/widget/news_card.dart';

class save extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black, // Background color
      appBar: AppBar(
        title: const Text(
          "Saved News", 
          style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white), // Title style
        ),
        backgroundColor:Colors.black, // Appbar background color
      ),
      body: BlocBuilder<NewNewsBloc, NewNewsState>(
        builder: (context, state) {
          if (state is NewssaveUpdated) { // If save are updated
            return ListView.builder(
              itemCount: state.save.length,
              itemBuilder: (BuildContext context, int index) {
                NewsData news = state.save[index];
                return NewsCard(data: news); // Use NewsCard to display each news item
              },
            );
          } else if (state is LoadEvent) { // If loading fails
            return Center(
              child: Text("Failed to load save"), // Error message
            );
          }
          return Center(
            child: Text(
              "No news found", // No news found message
              style: TextStyle(color: Color(0xffb8b8b8),fontSize: 15), // Message style
            ),
          );
        },
      ),
    );
  }
}
