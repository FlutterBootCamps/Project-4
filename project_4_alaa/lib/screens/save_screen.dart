import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4_alaa/bloc/news_bloc.dart';
import 'package:project_4_alaa/constant/color.dart';
import 'package:project_4_alaa/constant/space.dart';
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
                    if (state is SaveNewsState) {
                      return Wrap(
                        children: [
                          ...state.allSavedNews.map((element) =>
                             
                              SingleNewsCard(
                              allNews: element,
                              isSaved: bloc.selectedIndex == element.userID ? true : false,
                              onPressedSave: (newsSaved) {
                                bloc.add(SaveNewsEvent(savedNews: element,));
                              },
                            )
                             
                          ),
                        ],
                      );
                      

                      //
                    }
                    return const Text("Error Fetch News");
                  }),


                  //--------- list saved news or -----------
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Text(
                  //     "No news found",
                  //     style: TextStyle(
                  //         fontSize: 14,
                  //         fontWeight: FontWeight.w400,
                  //         color: grey),
                  //   ),
                  // ),
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
