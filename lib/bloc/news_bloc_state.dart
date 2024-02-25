part of 'news_bloc_bloc.dart';

@immutable
sealed class NewsBlocState {}

final class NewsBlocInitial extends NewsBlocState {}
 class LastUpdateState extends NewsBlocState{
   final List<Information>information;

  LastUpdateState({required this.information});
 }

  class UpdateNewsState extends NewsBlocState{}

  class ErrorsState extends NewsBlocState{}



/*part of 'news_bloc_bloc.dart';

@immutable
abstract class NewsBlocState {}

class NewsBlocInitial extends NewsBlocState {}

class LastUpdateState extends NewsBlocState {
  final List<Information> information;

  LastUpdateState({required this.information});
}

class UpdateNewsState extends NewsBlocState {}

class ErrorsState extends NewsBlocState {}
 */