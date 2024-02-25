part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}

final class LoadEvent extends NewsEvent{}

class AddToFavoritesEvent extends NewsEvent {
  final NewsData news;

  AddToFavoritesEvent(this.news);
}


class RemoveFromFavoritesEvent extends NewsEvent {
  final NewsData news;
 

  RemoveFromFavoritesEvent(this.news);
}