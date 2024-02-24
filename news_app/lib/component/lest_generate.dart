import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/component/news_row_card.dart';

class ListGenerate extends StatelessWidget {
  const ListGenerate({
    super.key,
    required this.listFilter,
  });
  final List<Tab> listFilter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        print(state);
        if (state is OnlyShowList) {
                    return Column(
            children: [
              ...List.generate(state.newsList.length, (index) {
                return             listFilter[DefaultTabController.of(context)
                                .index]
                            .text ==
                        state.newsList[index].field
                    ? NewsRowCard(
                        news: state.newsList[index],
                      )
                    : Container();
              })
            ],
          );
          
        }
         else{
          return Container(
            height: MediaQuery.of(context).size.height * 0.52,
            width: MediaQuery.of(context).size.width,
            color: Color.fromRGBO(17, 17, 17, 0.84),
            child: Center(
                child: Text("There is no artical",
                    style: TextStyle(color: Colors.white))),
          );
        }
      },
    );
  }
}
