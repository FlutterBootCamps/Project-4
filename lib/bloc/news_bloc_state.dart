part of 'news_bloc_bloc.dart';

@immutable
sealed class NewsBlocState {}

final class NewsBlocInitial extends NewsBlocState {}
final class LoadingState extends NewsBlocState {}

final class SuccessState extends NewsBlocState {
  List<NewsModel> list;
  SuccessState(this.list);
}
