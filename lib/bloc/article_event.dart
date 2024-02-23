part of 'article_bloc.dart';

@immutable
sealed class ArticleEvent {}

final class ChangeFieldEvent extends ArticleEvent {
  final int fieldIndex;

  ChangeFieldEvent({required this.fieldIndex});
}

final class SaveArticleEvent extends ArticleEvent {
  final Article article;

  SaveArticleEvent({required this.article});
}

final class EditArticleEvent extends ArticleEvent {
  final Article article;
  final String title;
  final String summary;
  final String content;

  EditArticleEvent(this.article, this.title, this.summary, this.content);
}

final class SearchEvent extends ArticleEvent {
  final String searchCriteria;

  SearchEvent({required this.searchCriteria});
}
