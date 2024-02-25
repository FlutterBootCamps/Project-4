import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_app/bloc/news_bloc.dart';
import 'package:games_app/models/news_data.dart';
import 'package:games_app/widget/news_widget.dart';


class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:Colors.black,
      appBar: AppBar(
        title: const Text(
          "saves News",
          style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white),
         
        ),
         backgroundColor:Colors.black,
      ),
      body:
       BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsFavoritesUpdated) {
            return ListView.builder(
              itemCount: state.favorites.length,
              itemBuilder: (BuildContext context, int index) {
                NewsData news = state.favorites[index];
                return NewsCard(data: news); 
              },
            );
          } else if (state is LoadEvent) {
            return Center(
              child: Text("Failed to load favorites"),
            );
          }
          return Center(
            child: CircularProgressIndicator(), 
          );
        },
      ),
    );
  }
}
