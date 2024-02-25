part of 'app_bloc.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}
final class SuccessAppState extends AppState {
final List<Blog> blogs;
  SuccessAppState({required this.blogs });
}
final class LoadingAppState extends AppState {}
final class ErrorAppState extends AppState {}
