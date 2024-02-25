part of 'articles_bloc.dart';

@immutable
sealed class ArticlesState {}

final class ArticlesInitial extends ArticlesState {}

final class LoudeningState extends ArticlesState {}

final class LoudeningSavedState extends ArticlesState {}

final class FinishLoudeningSavedState extends ArticlesState {
  final List<ArticleData> AllSavedArticleData;

  FinishLoudeningSavedState({required this.AllSavedArticleData});
}
final class ChangeSaveState extends ArticlesState {}

final class ErrorState extends ArticlesState {}

final class FinishLoudeningState extends ArticlesState {
  final List<ArticleData> AllArticleData;

  FinishLoudeningState({required this.AllArticleData});
}

final class FinishSearchinggState extends ArticlesState {
  final List<ArticleData> SearchingArticleData;

  FinishSearchinggState({required this.SearchingArticleData});
}
