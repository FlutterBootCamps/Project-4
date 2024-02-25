import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_4/data/article_data.dart';
import 'package:project_4/model/articles_model.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  List<ArticleData> allData = [];
  List<ArticleData> save = [];
  List<ArticleData> searchData = [];

  ArticlesBloc() : super(ArticlesInitial()) {
    for (var element in blogDataset) {
      allData.add(ArticleData.fromJson(element));
    }
    on<ArticlesEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LaudingDataEvent>(laudData);
    on<SavingDataEvent>(ladData);
    on<LaudingSavesDataEvent>(laudSavedData);
    on<RemoveSavesDataEvent>(removeSavedData);
    on<SavesChangesDataEvent>(changeData);
    on<SearchDataEvent>(SearcAllhData);
    on<SavingFromSearchEvent>(savedFromSearchPage);
  }

  FutureOr<void> laudData(
      LaudingDataEvent event, Emitter<ArticlesState> emit) async {
    try {
      emit(LoudeningState());
      await Future.delayed(const Duration(seconds: 2));
      emit(FinishLoudeningState(AllArticleData: allData));
    } catch (e) {
      emit(ErrorState());
    }
  }

  FutureOr<void> ladData(
      SavingDataEvent event, Emitter<ArticlesState> emit) async {
    if (save.contains(event.article)) {
      save.remove(event.article);
      emit(ChangeSaveState());
    } else {
      save.add(event.article);
      emit(ChangeSaveState());
      emit(FinishSearchinggState(SearchingArticleData: searchData));
    }
    emit(FinishLoudeningState(AllArticleData: allData));
  }

  Future<FutureOr<void>> laudSavedData(
      LaudingSavesDataEvent event, Emitter<ArticlesState> emit) async {
    try {
      emit(LoudeningSavedState());
      await Future.delayed(const Duration(seconds: 2));
      emit(FinishLoudeningSavedState(AllSavedArticleData: save));
    } catch (e) {
      emit(ErrorState());
    }
  }

  FutureOr<void> removeSavedData(
      RemoveSavesDataEvent event, Emitter<ArticlesState> emit) {
    save.remove(event.article);
    emit(FinishLoudeningSavedState(AllSavedArticleData: save));
  }

  FutureOr<void> changeData(
      SavesChangesDataEvent event, Emitter<ArticlesState> emit) {
    List.generate(
        allData.length,
        (index) => {
              if (allData[index].userID == event.article.userID)
                {
                  allData[index].title = event.title,
                  allData[index].summary = event.summary,
                  allData[index].content = event.content,
                },
            });
    emit(ChangeSaveState());
  }

  FutureOr<void> SearcAllhData(
      SearchDataEvent event, Emitter<ArticlesState> emit) async {
    searchData = [];
    try {
      emit(LoudeningState());
      await Future.delayed(const Duration(seconds: 2));
      List.generate(
          allData.length,
          (index) => {
                if (allData[index]
                    .title
                    .toLowerCase()
                    .contains(event.word.toLowerCase()))
                  {
                    if (searchData.contains(allData[index]))
                      {}
                    else
                      {searchData.add(allData[index])},
                  }
              });
      emit(FinishSearchinggState(SearchingArticleData: searchData));
    } catch (e) {
      emit(ErrorState());
    }
  }

  FutureOr<void> savedFromSearchPage(
      SavingFromSearchEvent event, Emitter<ArticlesState> emit) async {
    if (save.contains(event.article)) {
      save.remove(event.article);
      emit(FinishSearchinggState(SearchingArticleData: searchData));
    } else {
      save.add(event.article);
      emit(FinishSearchinggState(SearchingArticleData: searchData));
    }
    emit(FinishSearchinggState(SearchingArticleData: searchData));
  }
}
