import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_4/bloc/articles_bloc.dart';
import 'package:project_4/helper/extintion.dart';
import 'package:project_4/pages/explore_page/widgets/search_card.dart';

// ignore: must_be_immutable
class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});
  TextEditingController? controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 18, 18, 18),
        body:
            BlocBuilder<ArticlesBloc, ArticlesState>(builder: (context, state) {
          return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: context.getWidth() / 7.5,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(31, 255, 255, 255)),
                    child: TextField(
                      onChanged: (value) {
                        context
                            .read<ArticlesBloc>()
                            .add(SearchDataEvent(word: controller!.text));
                      },
                      // onSubmitted: (value) {
                      //   context
                      //       .read<ArticlesBloc>()
                      //       .add(SearchDataEvent(word: controller!.text));
                      // },
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 184, 184, 184)),
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.search,
                            size: 25,
                            color: Color.fromARGB(255, 184, 184, 184),
                          ),
                          hintText: "Search for News"),
                      controller: controller,
                    ),
                  ),
                  BlocBuilder<ArticlesBloc, ArticlesState>(
                    builder: (context, state) {
                      if (State is ArticlesInitial || state is LoudeningState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is FinishSearchinggState) {
                        return Column(
                          children: [
                            ...List.generate(
                              state.SearchingArticleData.length,
                              (index) {
                                return SearchArticlesCard(
                                    article: state.SearchingArticleData[index]);
                              },
                            )
                          ],
                        );
                      }
                      return Column(
                        children: [
                          SizedBox(
                            height: context.getHeight() / 3,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Color.fromARGB(255, 184, 184, 184),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Search for a news",
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color.fromARGB(255, 184, 184, 184)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ));
        }));
  }
}
