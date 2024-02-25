import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_4/models/news_model.dart';

part 'saved_bloc_event.dart';
part 'saved_bloc_state.dart';

class SavedBlocBloc extends Bloc<SavedBlocEvent, SavedBlocState> {
  SavedBlocBloc() : super(SuccessState(list: [])) {
    List<NewsModel> savedList = [];

    on<SavedEvent>((event, emit) {
      savedList.add(event.savedNews);
      emit(SuccessState(list: savedList));
    });

    on<NotSaved>((event, emit) {
      savedList.remove(event.unSavedNews);
      emit(SuccessState(list: savedList));
    });
  }
}
