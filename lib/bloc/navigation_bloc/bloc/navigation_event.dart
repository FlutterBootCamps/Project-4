part of 'navigation_bloc.dart';

@immutable
sealed class NavigationEvent {}

final class ChangePageEvent extends NavigationEvent {
  late int currentIndex;

  ChangePageEvent({required this.currentIndex});
}
