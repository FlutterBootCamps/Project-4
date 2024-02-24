import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/bloc/news_bloc.dart';

class BookMark extends StatelessWidget {
  BookMark({required this.news, Key? key}) : super(key: key);

    final NewsModel news;

  @override
  Widget build(BuildContext context) {
    Color color = news.isBookmarked ? Colors.white : Colors.grey;
    return IconButton(
      icon: Icon(
        size: 20,
        news.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
        color: color,
      ),
      onPressed: () {
        news.isBookmarked = !news.isBookmarked;
     BlocProvider.of<NewsBloc>(context).add(UpdateNews(news: news));
      },
    );
  }
}
