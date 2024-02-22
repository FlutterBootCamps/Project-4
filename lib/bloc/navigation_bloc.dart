import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/utils/setup.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigationEvent>((event, emit) {
    });

    on<ChangePageEvent>(changePage);
  }

  FutureOr<void> changePage(ChangePageEvent event, Emitter<NavigationState> emit) {
    getIt.currentPageIndex = event.pageIndex;
    emit(ChangedPageState());
  }
}
