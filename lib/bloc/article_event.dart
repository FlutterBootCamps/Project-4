part of 'article_bloc.dart';

@immutable
sealed class ArticleEvent {}

final class ChangeFieldEvent extends ArticleEvent{
  final int fieldIndex;

  ChangeFieldEvent({required this.fieldIndex});
}

final class SaveArticleEvent extends ArticleEvent{
  final Article article;

  SaveArticleEvent({required this.article});
}