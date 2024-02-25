part of 'saved_bloc_bloc.dart';

@immutable
sealed class SavedBlocEvent {}

final class SavedEvent extends SavedBlocEvent {
  final NewsModel savedNews;
  SavedEvent({required this.savedNews});
}

final class NotSaved extends SavedBlocEvent {
  final NewsModel unSavedNews;
  NotSaved({required this.unSavedNews});
}
