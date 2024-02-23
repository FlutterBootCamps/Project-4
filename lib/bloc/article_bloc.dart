import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/utils/setup.dart';
import 'package:news_app/widgets/article_card.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleInitial()) {
    on<ArticleEvent>((event, emit) {
    });
    
    on<ChangeFieldEvent>(changeField);
    on<SaveArticleEvent>(saveArticle);
  }

  FutureOr<void> changeField(ChangeFieldEvent event, Emitter<ArticleState> emit) {
    getIt.currentFieldIndex = event.fieldIndex;
    List<ArticleCard> generatedList = getIt.getFieldArticleList();
    if (generatedList.isNotEmpty) {
      emit(ChangedFieldState(generatedList: generatedList));
    }else{
      emit(ChangedFieldEmptyState());
    }
    
  }

  FutureOr<void> saveArticle(SaveArticleEvent event, Emitter<ArticleState> emit) {
    getIt.saveArticle(event.article);
    emit(SaveArticleState());
  }
}
