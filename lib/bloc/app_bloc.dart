import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project4/data/blog-dataset.dart';
import 'package:project4/model/model.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<LoadEvent>((event, emit) async{
      emit(LoadingAppState());
      await Future.delayed(const Duration(seconds: 1));

      try {
        emit(SuccessAppState(blogs: blogDataset.map((e) => Blog.fromJson(e)).toList()));
      } catch (e) {
        emit (ErrorAppState());
      }
    });
    
  }
}
