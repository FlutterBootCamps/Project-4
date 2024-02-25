import 'package:bloc/bloc.dart';
import 'package:games_app/data/data_jsom.dart';
import 'package:games_app/models/news_data.dart';

import 'package:meta/meta.dart';

part 'new_news_event.dart';
part 'new_news_state.dart';

class NewNewsBloc extends Bloc<NewNewsEvent, NewNewsState> {
  List<NewsData> save = [];
  List<NewsData> Listn = [];
 
  NewNewsBloc() : super(NewsInitial()) {
     
    on<LoadEvent>((event, emit) {
      try {
        emit(LoadingState());

       List<NewsData> listNews = [];
        
        for (var element in blogDataset) {
          listNews.add(NewsData.fromJson(element));
          print(listNews[0]);
        }

        //load data

        emit(SuccessState(newnewslist: listNews, save: []));
      } catch (error) {
        emit(ErrorState());
      }
    });
  
 

on<AddToSaveEvent>((event, emit) {
      if (!save.any((news) => news.userID == event.newses.userID)) {
        save.add(event.newses);
        emit(NewssaveUpdated(List.unmodifiable(save)));
      }
    });


     on<RemoveFromSaveEvent>((event, emit) {
      save.removeWhere((news) => news.userID == event.newses.userID);
      emit(NewssaveUpdated(List.unmodifiable(save)));
    });


 on<SearchNewNewsEvent>((event, emit) {
      // تطبيق الفلترة بناءً على الاستعلام event.elements
      List<NewsData> filteredNews = Listn.where((news) =>
        news.title.toLowerCase().contains(event.elements.toLowerCase())
      ).toList();
      emit(SuccessState(newnewslist: filteredNews, save: save));
    });


on<ClearSearchEvent>((event, emit) {
  Listn = []; 
  emit(NewsInitial());
});

   
  }
}



