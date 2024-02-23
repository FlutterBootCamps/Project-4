part of 'article_bloc.dart';

@immutable
sealed class ArticleState {}

final class ArticleInitial extends ArticleState {}

final class ChangedFieldState extends ArticleState {
  final List<ArticleCard> generatedList;
  ChangedFieldState({required this.generatedList});
}

final class ChangedFieldEmptyState extends ArticleState {

}

final class SaveArticleState extends ArticleState {
  final String message;
  final Color color;

  SaveArticleState(this.message, this.color);
}

final class EditedArticleState extends ArticleState {
  final String message;

  EditedArticleState(this.message);
}

final class EditedArticleErrorState extends ArticleState {
  final String message;

  EditedArticleErrorState(this.message);
}

final class SearchState extends ArticleState {
  final List<ArticleCard> generatedList;
  SearchState({required this.generatedList});

}

final class SearchEmptyState extends ArticleState {
  final String message;

  SearchEmptyState({required this.message});
}