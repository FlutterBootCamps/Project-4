part of 'blog_bloc.dart';

@immutable
sealed class BlogEvent {}

final class LoadingEvent extends BlogEvent {}

final class SavedEvent extends BlogEvent {
  final int index;
  SavedEvent({required this.index});
}

final class TapFieldEvent extends BlogEvent {
  final String tappedField;
  TapFieldEvent(this.tappedField);
}

final class SearchEvent extends BlogEvent {
  final String input;
  SearchEvent(this.input);
}

final class EditEvent extends BlogEvent {
  final int index;
  final String? title;
  final String? summary;
  final String? content;
  EditEvent({required this.index, this.title, this.summary, this.content});
}
