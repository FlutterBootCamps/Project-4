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
  
}