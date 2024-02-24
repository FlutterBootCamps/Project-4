import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4_alaa/bloc/news_bloc.dart';
import 'package:project_4_alaa/constant/color.dart';
import 'package:project_4_alaa/constant/space.dart';
import 'package:project_4_alaa/helper/screen_helper.dart';
import 'package:project_4_alaa/widgets/single_news_card_widget.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NewsBloc>(context);

    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Saved News",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: white),
                  ),
                  height24,
                  BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
                    if (state is LoadingNewsState || state is NewsInitial) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is DisplatNewsState) {
                      return Wrap(
                        children: [
                          ...state.allNews.map(
                            (element) => element.isSaved
                                ? SingleNewsCard(
                                    allNews: element,
                                    onPressedSave: (newsSaved) {
                                      bloc.add(
                                          SaveNewsEvent(savedNews: element));
                                    })
                                : const SizedBox.shrink(),
                          ),
                        ],
                      );
                    }

                    return const Text("Error Fetch News");
                  }),
                  // SizedBox(
                  //     width: context.getWidth(),
                  //     height: context.getHeight() / 1.5,
                  //     child: const Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Text(
                  //           "No news found",
                  //           style: TextStyle(
                  //               color: grey,
                  //               fontSize: 20,
                  //               fontWeight: FontWeight.w200),
                  //         ),
                  //       ],
                  //     )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
