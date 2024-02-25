import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/bloc/saved_bloc/bloc/saved_bloc_bloc.dart';
import 'package:project_4/constant/color.dart';
import 'package:project_4/models/news_model.dart';
import 'package:project_4/pages/news_page.dart';

class CadrWidget extends StatelessWidget {
  CadrWidget({super.key, required this.news});
  NewsModel news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NewsPage(news: news)));
        },
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: backgroundAppBar,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            child: Column(
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      news.img!,
                      height: 80,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news.author!,
                          style: TextStyle(fontSize: 15, color: whiColor),
                        ),
                        Text(
                          news.title!,
                          style: TextStyle(
                              fontSize: 16,
                              color: whiteColor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ]),
                Row(
                  children: [
                    Text(
                      "${news.date} • ${news.readingMinutes} min read",
                      style: TextStyle(fontSize: 12, color: whiColor),
                    ),
                    const Spacer(),
                    BlocBuilder<SavedBlocBloc, SavedBlocState>(
                      builder: (context, state) {
                        if (state is SuccessState) {
                          print(state.list.length);
                          bool isExist = state.list.contains(news);
                          return IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                if (isExist) {
                                  context
                                      .read<SavedBlocBloc>()
                                      .add(NotSaved(unSavedNews: news));
                                } else {
                                  context
                                      .read<SavedBlocBloc>()
                                      .add(SavedEvent(savedNews: news));
                                }
                              },
                              icon: Icon(
                                isExist
                                    ? Icons.bookmark
                                    : Icons.bookmark_border_outlined,
                                size: 30,
                                color: greyColor,
                              ));
                        } else {
                          return Text("error");
                        }
                      },
                    ),
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert,
                          color: greyColor,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
