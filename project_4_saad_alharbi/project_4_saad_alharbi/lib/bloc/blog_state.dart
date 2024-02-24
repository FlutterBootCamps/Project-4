part of 'blog_bloc.dart';

@immutable
sealed class BlogState {}

final class BlogInitial extends BlogState {}

final class LoadingState extends BlogState {}

final class SuccessState extends BlogState {
 final List<BlogModel> blogs;
 final List<int> savedList;
 final String? tappedField;
 final String? input;

  SuccessState({
    required this.blogs,
    required this.savedList,
    this.tappedField,
    this.input,
  });
}


final class ErrorState extends BlogState {}
