part of 'news_bloc.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class SuccessState extends NewsState {
  final List newslist;
  SuccessState({required this.newslist, required List<NewsData> favorites});
}

final class LoadingState extends NewsState {}

final class ErrorState extends NewsState {}

class NewsFavoritesUpdated extends NewsState {
  final List favorites;

  NewsFavoritesUpdated( this.favorites);
}