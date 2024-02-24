import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/database/blog-dataset.dart';
import 'package:news_app/model/news_model.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
     List<NewsModel> listForGenerator = [];
     List<NewsModel> listForShow = [];


  List<Tab> listFilter = <Tab>[
    const Tab(text: "AI"),
    const Tab(text: "technology"),
    const Tab(text: "Cloud"),
    const Tab(text: "Robotics"),
    const Tab(text: "IoT"),
    const Tab(text: "Cybersecurity"),

  ];

  NewsBloc() : super(NewsInitial()) {
    on<NewsEvent>((event, emit) {
      if(listForGenerator.isEmpty){
      for (var e in blogDataset) {
        listForGenerator.add(NewsModel.fromJson(e));
      }
      emit(LoadState(listForGenerator));
      }
    });
    
        on<FilterEvent>((event, emit) {
          listForShow.clear();
      for (var e in listForGenerator) {
          listForShow.add(e);
        
      }
      emit(OnlyShowList(listForShow));

    });
    on<UpdateNews>((event, emit) {
      final NewsModel news = event.news;
      for(int i=0;i<listForGenerator.length;i++){
        if(listForGenerator[i].userID==news.userID){
          listForGenerator[i]=news;
        }}
      emit(ListUpdated(listForGenerator));
      emit(OnlyShowList(listForShow));
    });

        on<SearchNews>((event, emit) {
      listForShow.clear();
      final String search = event.title;
      for (var e in listForGenerator) {
        if(e.title==search){
          listForShow.add(e);
        }}
      emit(OnlyShowList(listForGenerator));
    });
    
    on<NavigatorBarEvent>((event, emit) {

      final int index = event.index;
      emit(NavigatorBarState(index));
    });

    }
}
