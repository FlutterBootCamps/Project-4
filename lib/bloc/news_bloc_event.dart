part of 'news_bloc_bloc.dart';

@immutable
sealed class NewsBlocEvent {}


class InitialEvent extends NewsBlocEvent {}


class LoadingEvent extends NewsBlocEvent {}

class FillteringEvent extends NewsBlocEvent {
  final String field;
  FillteringEvent({required this.field});
}

final class SearchEnevt extends NewsBlocEvent {
  final String searchWord;
  SearchEnevt({required this.searchWord});
}




