import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_4_alaa/dataset/blog-dataset%20.dart';
import 'package:project_4_alaa/model/news_model.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  int selectedIndex = -1;
  // List<NewsModel> savedNews = [];
  List<NewsModel> searchedNews = [];
  List<NewsModel> news = [];

  NewsBloc() : super(NewsInitial()) {
    on<NewsEvent>((event, emit) {});

    on<FetchAllNewsEvent>((event, emit) {
      if (news.isEmpty) {
        for (var element in blogDataset) {
          news.add(NewsModel.fromJson(element));
        }
      }
      try {
        emit(LoadingNewsState());
        print("loading");
        Future.delayed(const Duration(seconds: 1));

        emit(DisplatNewsState(allNews: news));
        print("Success fetch");
      } catch (error) {
        print("eroor fetch news");
        emit(ErrorState());
      }
    });

    on<SaveNewsEvent>(methodSaveNews);

    on<UpdateNewsEvent>(MethodUpdateNews);

    on<SearchNewsEvent>(methodNewsSearch);
  }

  FutureOr<void> methodSaveNews(SaveNewsEvent event, Emitter<NewsState> emit) {

    print(" saved news");
    event.savedNews.isSaved = !event.savedNews.isSaved;

    // selectedIndex = event.savedNews.userID;
    // // print(selectedIndex); print(savedNews.length);  print(savedNews.isEmpty);
    // if (savedNews.isEmpty || savedNews.where((element) =>
    //         (element.title.contains(event.savedNews.title))).toList().isEmpty
    //     //  !savedNews.contains(event.savedNews)
    //     ) {
    //   savedNews.add(NewsModel(
    //     userID: event.savedNews.userID,
    //     author: event.savedNews.author,
    //     title: event.savedNews.title,
    //     field: event.savedNews.field,
    //     summary: event.savedNews.summary,
    //     content: event.savedNews.content,
    //     date: event.savedNews.date,
    //     readingMinutes: event.savedNews.readingMinutes,
    //     userImg: event.savedNews.userImg,
    //     img: event.savedNews.img,
    //     isSaved: true,
    //     newsId: null,
    //   ));
    //   // savedNews.add( event.savedNews);
    //   // savedNews[NewsModel.fromJson(event.savedNews)].isSaved = true;
    // } else if (savedNews.contains(event.savedNews)) {
    //   savedNews.remove(event.savedNews);
    // }

    emit(DisplatNewsState(allNews: news, ));
  }

  FutureOr<void> MethodUpdateNews(
      UpdateNewsEvent event, Emitter<NewsState> emit) {
    // print("update");
    // print(event.id);
    // print(event.newTitle);
    // print(NewsModel.fromJson(blogDataset[event.id]).title);
    for (int i = 0; i < news.length; i++) {
      if (news[i].userID == event.id) {
        print(news[i]);
        //  == event.id);
        //  print(NewsModel.fromJson(blogDataset[i]).title);
        if (event.newTitle.isNotEmpty) {
          print(news[i].title);
          news[i].title = event.newTitle;
          print(news[i].title);
        }
        if (event.newSummary.isNotEmpty) {
          news[i].summary = event.newSummary;
        }
        if (event.newContent.isNotEmpty) {
          news[i].content = event.newContent;
        }
      }
    }
    emit(UpdateNewsState());
  }

  FutureOr<void> methodNewsSearch(
      SearchNewsEvent event, Emitter<NewsState> emit) {
    searchedNews.clear();
    for (var element in blogDataset) {
      print(" search news");
      print(event.title);
      print(NewsModel.fromJson(element).title);

      if (NewsModel.fromJson(element)
          .title
          .toLowerCase()
          .contains(event.title.toLowerCase())) {
        searchedNews.add(NewsModel.fromJson(element));
        print(element);
      } else {
        print("else");
      }
    }
    try {
      emit(LoadingSearchNewsState());
      print("loading");
      Future.delayed(const Duration(seconds: 1));

      emit(SearchState(newsSearched: searchedNews));
      print("Success search");
    } catch (error) {
      print("error fetch news");
      emit(ErrorState());
    }
  }
}
