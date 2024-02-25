part of 'articles_bloc.dart';

@immutable
sealed class ArticlesEvent {}

class LaudingDataEvent extends ArticlesEvent {}

class LaudingSavesDataEvent extends ArticlesEvent {}

class RemoveSavesDataEvent extends ArticlesEvent {
  final ArticleData article;
  RemoveSavesDataEvent({required this.article});
}

class SavingDataEvent extends ArticlesEvent {
  final ArticleData article;
  SavingDataEvent({required this.article});
}

class SavesChangesDataEvent extends ArticlesEvent {
  final ArticleData article;
  final String title;
  final String summary;
  final String content;

  SavesChangesDataEvent(
      {required this.article,
      required this.title,
      required this.summary,
      required this.content});
}

class SearchDataEvent extends ArticlesEvent {
  final String word;

  SearchDataEvent({required this.word});
}

class SavingFromSearchEvent extends ArticlesEvent {
  final ArticleData article;
  SavingFromSearchEvent({required this.article});
}
