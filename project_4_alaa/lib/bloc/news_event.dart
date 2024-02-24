part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}

class FetchAllNewsEvent extends NewsEvent {}


class SaveNewsEvent extends NewsEvent {
  final NewsModel savedNews;
  // bool saved;
  SaveNewsEvent({required this.savedNews, 
  // required this.saved
  });
}

class SearchNewsEvent extends NewsEvent {
  final String title;
  SearchNewsEvent({required this.title});

}

class UpdateNewsEvent extends NewsEvent {

  final int id; 
  String newTitle; 
  String newSummary ;
  String newContent; 
  UpdateNewsEvent({ 
    required this.id, 
  required this.newTitle, 
  required this.newSummary,
  required this.newContent});

}

