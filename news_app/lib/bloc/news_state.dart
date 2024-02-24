part of 'news_bloc.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {
  
  
}

final class ErorrState extends NewsState {}

final class OnlyShowList extends NewsState {
    final List<NewsModel> newsList;
  OnlyShowList(this.newsList);
}

final class LoadState extends NewsState {
  final List<NewsModel> newsList;
  LoadState(this.newsList);
}

final class ListUpdated extends NewsState {
  final List<NewsModel> news;
  ListUpdated(this.news);
}
final class ListSearch extends NewsState {
  final List<NewsModel> newsList;
  ListSearch(this.newsList);
}
final class NavigatorBarState extends NewsState {
  final int index;
  NavigatorBarState(this.index);
}