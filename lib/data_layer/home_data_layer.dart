import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/data/article_data.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/screens/explore_page.dart';
import 'package:news_app/screens/feed_page.dart';
import 'package:news_app/screens/profile_page.dart';
import 'package:news_app/screens/saved_page.dart';
import 'package:news_app/widgets/article_card.dart';

// This is where important data is stored and can be taken using getIt
class HomeData {
  HomeData() {
    loadDataFromStorage();
    if (articleList.isEmpty) {
      loadOriginalArticleList();
    }
  }

  int currentPageIndex = 0;
  int currentFieldIndex = 0;
  var locator = GetStorage();

  List<Widget> pageList = [
    const FeedPage(),
    const ExplorePage(),
    const SavedPage(),
    const ProfilePage()
  ];
  List<String> fieldList = [
    "technology",
    "ai",
    "cloud",
    "cybersecurity",
    "iot",
  ];

  List<Article> articleList = [];

  void loadOriginalArticleList() {
    articleList = List.generate(blogDataset.length, (index) {
      return Article.fromJson(blogDataset[index]);
    });
  }

  List<ArticleCard> getFieldArticleList() {
    String field = fieldList[currentFieldIndex];
    List<ArticleCard> generatedList = [];

    for (var element in articleList) {
      if (element.field.toLowerCase() == field) {
        generatedList.add(ArticleCard(article: element));
      }
    }
    return generatedList;
  }

  void saveArticle(Article article) {
    articleList
        .firstWhere((element) => element.userID == article.userID)
        .isSaved = !article.isSaved;
    uploadDataToStorage();
  }

  bool editArticle(
      Article article, String title, String summary, String content) {
    if (title.trim().isEmpty ||
        summary.trim().isEmpty ||
        content.trim().isEmpty) {
      return false;
    } else {
      Article articleToEdit =
          articleList.firstWhere((element) => element.userID == article.userID);
      articleToEdit.title = title;
      articleToEdit.summary = summary;
      articleToEdit.content = content;
      uploadDataToStorage();
      return true;
    }
  }

  List<ArticleCard> getSearchArticleList(String searchText) {
    List<ArticleCard> generatedList = [];
    if (searchText.trim().isNotEmpty) {
      for (var element in articleList) {
        if (element.title.toLowerCase().contains(searchText.toLowerCase())) {
          generatedList.add(ArticleCard(article: element));
        }
      }
    }
    return generatedList;
  }

  List<ArticleCard> getSavedArticleList() {
    List<ArticleCard> generatedList = [];
    for (var element in articleList) {
      if (element.isSaved) {
        generatedList.add(ArticleCard(article: element));
      }
    }
    return generatedList;
  }

  void loadDataFromStorage() {
    articleList = (locator.read<List<dynamic>>("articleList") ?? [])
        .map((e) => Article.fromJson(e))
        .toList();
  }

  void uploadDataToStorage() {
    locator.write("articleList", articleList.map((e) => e.toJson()).toList());
  }
}
