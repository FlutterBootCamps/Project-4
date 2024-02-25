part of 'news_bloc_bloc.dart';

@immutable
sealed class NewsBlocEvent {}
class UpdateNewsEvent extends NewsBlocEvent{}

class BookmarkEvent extends NewsBlocEvent {
  final Information information;

  BookmarkEvent(this.information);
}


/*part of 'news_bloc_bloc.dart';

@immutable
abstract class NewsBlocEvent {}

class UpdateNewsEvent extends NewsBlocEvent {}

class BookmarkEvent extends NewsBlocEvent {
  final Information information;

  BookmarkEvent(this.information);
}
 */
