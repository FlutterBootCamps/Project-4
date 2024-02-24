import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_4_saad_alharbi/dataset/blog-dataset.dart';
import 'package:project_4_saad_alharbi/model/blog_model.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  List<BlogModel> blogList =
      blogDataset.map((item) => BlogModel.fromJson(item)).toList();
  List<int> savedList = [];
  String tapField = 'technology';
  String? input;

  BlogBloc() : super(BlogInitial()) {
    on<LoadingEvent>((event, emit) {
      try {
        emit(LoadingState());

        emit(SuccessState(blogs: blogList, savedList: savedList));
      } catch (e) {
        emit(ErrorState());
      }
    });

    on<SavedEvent>((event, emit) {
      if (!savedList.contains(event.index)) {
        savedList.add(event.index);
      } else {
        savedList.remove(event.index);
      }

      emit(SuccessState(blogs: blogList, savedList: savedList));
    });

    on<TapFieldEvent>((event, emit) {
      tapField = event.tappedField;

      emit(SuccessState(
          blogs: blogList, savedList: savedList, tappedField: tapField));
    });

    on<SearchEvent>((event, emit) {
      input = event.input;

      emit(SuccessState(blogs: blogList, savedList: savedList, input: input));
    });

    on<EditEvent>((event, emit) {
      blogList[event.index].title = event.title!;
      blogList[event.index].summary = event.summary!;
      blogList[event.index].content = event.content!;

      emit(SuccessState(blogs: blogList, savedList: savedList));
    });
  }
}
