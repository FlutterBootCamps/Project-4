part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}

class LoadEvent extends NewsEvent {}

class FilterEvent extends NewsEvent {
  final int index;
  FilterEvent({required this.index});
}
