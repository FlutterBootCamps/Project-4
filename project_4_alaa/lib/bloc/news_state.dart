part of 'news_bloc.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class LoadingNewsState extends NewsState {}

// final class SuccessState extends NewsState {}

final class DisplatNewsState extends NewsState {
  List<NewsModel> allNews; 
  DisplatNewsState({ required this.allNews});
}

// final class SaveNewsState extends NewsState {
//   List<NewsModel> allSavedNews ;
//   // bool isSaved;
//   SaveNewsState({required this.allSavedNews, 
//   // required this.isSaved
//   });
// }

final class SearchState extends NewsState {
  List<NewsModel> newsSearched ;
  SearchState({required this.newsSearched});
}


final class  LoadingSearchNewsState extends NewsState {}

final class  UpdateNewsState extends NewsState {}

final class ErrorState extends NewsState {}
