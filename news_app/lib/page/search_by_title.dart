import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/component/news_row_card.dart';
import 'package:news_app/page/const_color.dart';

class SearchByTitle extends StatelessWidget {
  SearchByTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController title = TextEditingController();
    title.text = "myWorkGropeBadLuke";

    return Scaffold(
        backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
        appBar: AppBar(
          backgroundColor: appBarColor,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  BlocProvider.of<NewsBloc>(context)
                      .add(SearchNews(title: title.text));
                },
                style: TextStyle(color: mainTextColor),
                controller: title,
                decoration: InputDecoration(
                  hintText: "Search for News",
                  hintStyle: TextStyle(color: mainTextColor),
                  prefixIcon: Icon(
                    Icons.search,
                    color: mainTextColor,
                  ),
                  fillColor: const Color.fromRGBO(255, 255, 255, 0.12),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is OnlyShowList) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        ...List.generate(state.newsList.length, (index) {
                          return state.newsList[index].title
                                  .toLowerCase()
                                  .contains(title.text.toLowerCase())
                              ? NewsRowCard(
                                  news: state.newsList[index],
                                )
                              : Container();
                        })
                      ],
                    ),
                  );
                } else if (state is OnlyShowList) {
                  print(state.newsList.length);
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        ...List.generate(state.newsList.length, (index) {
                          return state.newsList[index].title
                                  .toLowerCase()
                                  .contains(title.text.toLowerCase())
                              ? NewsRowCard(
                                  news: state.newsList[index],
                                )
                              : Container();
                        })
                      ],
                    ),
                  );
                } else {
                  print(title.text);
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.52,
                    width: MediaQuery.of(context).size.width,
                    child: const Center(
                        child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Color.fromRGBO(184, 184, 184, 1),
                        ),
                        Text(
                          "Search for a news",
                          style: TextStyle(
                              color: Color.fromRGBO(184, 184, 184, 1)),
                        )
                      ],
                    )),
                  );
                }
              },
            ),
          ],
        ));
  }
}
