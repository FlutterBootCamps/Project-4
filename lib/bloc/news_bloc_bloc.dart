import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_4/dataset/news_data.dart';
import 'package:project_4/models/news_model.dart';

part 'news_bloc_event.dart';
part 'news_bloc_state.dart';

class NewsBlocBloc extends Bloc<NewsBlocEvent, NewsBlocState> {
  NewsBlocBloc() : super(NewsBlocInitial()) {
    List<NewsModel> newsList = [];

    for (var element in blogDataset) {
      newsList.add(NewsModel.fromJson(element));
    }

    on<InitialEvent>((event, emit) {
      emit(SuccessState([]));
    });

    on<LoadingEvent>((event, emit) {
      Future.delayed(Duration(milliseconds: 1000));
      emit(SuccessState(newsList));
    });

    on<FillteringEvent>((event, emit) {
      List<NewsModel> fillterList = [];
      if (event.field == "Tech") {
        emit(SuccessState(newsList));
      } else {
        for (NewsModel news in newsList) {
          if (news.field == event.field) {
            fillterList.add(news);
          }
        }
        emit(SuccessState(fillterList));
      }
    });

    on<SearchEnevt>((event, emit) {
      List<NewsModel> searchList = [];
      for (NewsModel news in newsList) {
        if (news.title!.toLowerCase().contains(event.searchWord)) {
          searchList.add(news);
        }
        emit(SuccessState(searchList));
      }
    });
  }
}
