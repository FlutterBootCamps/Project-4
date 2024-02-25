part of 'new_news_bloc.dart';

@immutable
sealed class NewNewsEvent {}

final class LoadEvent extends NewNewsEvent{}

class AddToSaveEvent extends NewNewsEvent {
  final NewsData newses;

  AddToSaveEvent(this.newses);
}


class RemoveFromSaveEvent extends NewNewsEvent {
  final NewsData newses;
 

  RemoveFromSaveEvent(this.newses);
}

class SearchNewNewsEvent extends NewNewsEvent {
  final String elements;

  SearchNewNewsEvent(this.elements);
}
class ClearSearchEvent extends NewNewsEvent {}

class NewsEmptyEvent extends NewNewsEvent {}

