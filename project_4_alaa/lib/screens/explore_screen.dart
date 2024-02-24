import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4_alaa/bloc/news_bloc.dart';
import 'package:project_4_alaa/constant/color.dart';
import 'package:project_4_alaa/constant/space.dart';
import 'package:project_4_alaa/helper/screen_helper.dart';
import 'package:project_4_alaa/widgets/search_textfield_widget.dart';
import 'package:project_4_alaa/widgets/single_news_card_widget.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              Column(
                children: [
                  SearchTextFieldWidget(),
               
                  height48,
                  ListView(
                    shrinkWrap: true,
                    children: [
                      BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
                       
                        if (state is LoadingSearchNewsState) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        if (state is SearchState) {
                          return ListView(
                            shrinkWrap: true,
                            children: [
                              ...state.newsSearched.map((element) {
                                if (element.title.isEmpty)  {
                                  return SizedBox(
                                    width: context.getWidth(),
                                    height: context.getWidth(),
                                    child: const Center(
                                      child: Text(
                                        "Result not found",
                                        style: TextStyle(color: white),
                                      ),
                                    ),
                                  );
                                }
                                return SingleNewsCard(allNews: element);
                              }),
                            ],
                          );
                        }
                         if (searchController.text.isEmpty){
                          return SizedBox(
                            width: context.getWidth(),
                            height: context.getHeight() / 2 ,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.search, color: grey),
                                Text("Search for a news", style: TextStyle(color: grey, fontSize: 20, fontWeight: FontWeight.w200),),
                              ],
                            ));
                        }
                        return const Text("Error Fetch News");
                      }),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
