import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/component/news_row_card.dart';

import '../bloc/news_bloc.dart';

class SavedNews extends StatelessWidget {
  const SavedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title:
              const Text("Saved News", style: TextStyle(color: Colors.white)),
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is OnlyShowList) {
              return Column(
                children: [
                  ...List.generate(state.newsList.length, (index) {
                    return state.newsList[index].isBookmarked
                        ? NewsRowCard(
                            news: state.newsList[index],
                          )
                        : Container();
                  })
                ],
              );
            } else {
              return Container(
                height: MediaQuery.of(context).size.height * 0.52,
                width: MediaQuery.of(context).size.width,
                color: const Color.fromRGBO(17, 17, 17, 0.84),
                child: const Center(
                    child: Text("There is no artical",
                        style: TextStyle(color: Colors.white))),
              );
            }
          },
        ));
  }
}
