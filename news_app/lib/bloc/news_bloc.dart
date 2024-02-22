import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/database/blog-dataset.dart';
import 'package:news_app/model/news_model.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  List<NewsModel> listForGenerator = [];

  NewsBloc() : super(NewsInitial()) {
    on<NewsEvent>((event, emit) {
      listForGenerator.clear();
      for (var e in blogDataset) {
        listForGenerator.add(NewsModel.fromJson(e));
      }
      emit(LoadState(listForGenerator));
      // TODO: implement event handler
    });
    on<FilterEvent>((event, emit) {
      final int index = event.index;
      emit(ChangeState(index, listForGenerator));
    });
  }
}
