import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project4/dataset/blog-dataset.dart';
import 'package:project4/model/information.dart';

part 'news_bloc_event.dart';
part 'news_bloc_state.dart';

class NewsBlocBloc extends Bloc<NewsBlocEvent, NewsBlocState> {
  NewsBlocBloc() : super(NewsBlocInitial()) {
    on<UpdateNewsEvent>((event, emit)async {
      try{
        emit(UpdateNewsState());
        await Future.delayed(Duration(seconds: 3));
        List<Information>NewNews=[];
        for (var element in BlogDataset){
          NewNews.add(Information.fromJson(element));
        }
        emit (LastUpdateState(information: NewNews));
      }catch (e){
        print("Error #404");
        emit(ErrorsState());
      }

    });
  }
}



/*class NewsBlocBloc extends Bloc<NewsBlocEvent, NewsBlocState> {
  NewsBlocBloc() : super(NewsBlocInitial());

  @override
  Stream<NewsBlocState> mapEventToState(NewsBlocEvent event) async* {
    if (event is UpdateNewsEvent) {
      yield* _mapUpdateNewsEventToState();
    }
  }

  Stream<NewsBlocState> _mapUpdateNewsEventToState() async* {
    yield UpdateNewsState();
    try {
      await Future.delayed(Duration(seconds: 3));
      List<Information> newNews = [];
      for (var element in BlogDataset) {
        newNews.add(Information.fromJson(element));
      }
      yield LastUpdateState(information: newNews);
    } catch (e) {
      print("Error #404");
      yield ErrorsState();
    }
  }
} */
