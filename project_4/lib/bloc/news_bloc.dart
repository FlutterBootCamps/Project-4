import 'package:bloc/bloc.dart';
import 'package:games_app/data/data_jsom.dart';
import 'package:games_app/models/news_data.dart';
import 'package:meta/meta.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  List<NewsData> favorites = [];
  List<NewsData> currentNewsList = [];
  NewsBloc() : super(NewsInitial()) {
     
    on<LoadEvent>((event, emit) {
      try { emit(LoadingState()); List<NewsData> newNews = [];
        
        for (var element in blogDataset) { newNews.add(NewsData.fromJson(element)); print(newNews[0]);  }
        emit(SuccessState(newslist: newNews, favorites: []));
      } catch (error) {   emit(ErrorState());
      } });
   //------

on<AddToFavoritesEvent>((event, emit) {
      if (!favorites.any((news) => news.userID == event.news.userID)) { favorites.add(event.news);  emit(NewsFavoritesUpdated(List.unmodifiable(favorites)));
      } });

//----------------
     on<RemoveFromFavoritesEvent>((event, emit) {
      favorites.removeWhere((news) => news.userID == event.news.userID); emit(NewsFavoritesUpdated(List.unmodifiable(favorites)));
    });}}



