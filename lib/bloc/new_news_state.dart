part of 'new_news_bloc.dart';

@immutable
sealed class NewNewsState {}

final class NewsInitial extends NewNewsState {}

final class SuccessState extends NewNewsState {
  final List newnewslist;
  final List<NewsData> save;
  SuccessState({required this.newnewslist, required this.save});
}

final class LoadingState extends NewNewsState {}

final class ErrorState extends NewNewsState {}

class NewssaveUpdated extends NewNewsState {
  final List save;

  NewssaveUpdated( this.save);
}

class NewsEmptyState extends NewNewsState {}