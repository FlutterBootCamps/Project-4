part of 'navigation_bloc.dart';

@immutable
sealed class NavigationState {}

final class NavivationInitial extends NavigationState {
  
}


final class SuccessState extends NavigationState {
  final int currentIndex;
  SuccessState(this.currentIndex);
}
