part of 'saved_bloc_bloc.dart';

@immutable
sealed class SavedBlocState {}

final class SavedBlocInitial extends SavedBlocState {}

final class SuccessState extends SavedBlocState {
  List<NewsModel> list;
  SuccessState({required this.list});
}
