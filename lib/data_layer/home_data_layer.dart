
import 'package:flutter/material.dart';
import 'package:news_app/data/article_data.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/screens/explore_page.dart';
import 'package:news_app/screens/feed_page.dart';
import 'package:news_app/screens/profile_page.dart';
import 'package:news_app/screens/saved_page.dart';

class HomeData{

  HomeData(){
    loadOriginalArticleList();
  }

  int currentPageIndex = 0;

  List<Widget> pageList = [
    const FeedPage(),
    const ExplorePage(),
    const SavedPage(),
    const ProfilePage()
  ];

  List<Article> articleList = [];

  void loadOriginalArticleList(){
    articleList = List.generate(blogDataset.length, (index) {
      return Article.fromJson(blogDataset[index]);
    });
  }
}