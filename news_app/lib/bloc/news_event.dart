part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {
}

class LoadEvent extends NewsEvent {}

class FilterEvent extends NewsEvent {
  final int index;
  FilterEvent({this.index=0});
}
class UpdateNews extends NewsEvent {
  final NewsModel news;
UpdateNews({required this.news});
}
class SearchNews extends NewsEvent {
  final String title;
SearchNews({required this.title});
}
class NavigatorBarEvent extends NewsEvent {
  final int index;
NavigatorBarEvent({required this.index});
}