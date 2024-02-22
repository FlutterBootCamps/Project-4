part of 'news_bloc.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class ErorrState extends NewsState {}

final class EditState extends NewsState {}

final class LoadState extends NewsState {
  final List<NewsModel> newsList;
  LoadState(this.newsList);
}

final class ChangeState extends NewsState {
  final List<NewsModel> newsList;
  final int index;
  ChangeState(this.index, this.newsList);
}
