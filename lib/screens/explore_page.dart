import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/article_bloc.dart';
import 'package:news_app/helpers/extensions/screen_helper.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/fonts.dart';
import 'package:news_app/widgets/icon_text_container_big.dart';
import 'package:news_app/widgets/text_box_field.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bgColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                TextBoxField(
                  controller: searchController,
                  maxLines: 1,
                  prefixIcon: Image.asset("assets/icons/search_grey.png"),
                  hintText: "Search for News",
                  onChanged: (text) {
                    context.read<ArticleBloc>().add(
                        SearchEvent(searchCriteria: searchController.text));
                  },
                ),
                const SizedBox(
                  height: 53,
                ),
                BlocConsumer<ArticleBloc, ArticleState>(
                  listener: (context, state) {
                    if (state is SaveArticleState) {
                      context.showSnackBar(context, state.message, state.color);
                      context.read<ArticleBloc>().add(SearchEvent(searchCriteria: searchController.text));
                    }
                  },
                  builder: (context, state) {
                    if (state is SearchState && searchController.text.isNotEmpty) {
                      return SizedBox(
                        width: context.getWidth(context),
                        height: context.getHeight(context) * 0.72,
                        child: ListView(
                          children: state.generatedList,
                        ),
                      );
                    } else if (state is SearchEmptyState &&
                        searchController.text.isNotEmpty) {
                      return Text(
                        state.message,
                        style: const TextStyle(
                            color: lilGreyColor,
                            fontFamily: mainFont,
                            fontSize: 20),
                      );
                    } else {
                      return const Column(
                        children: [
                          SizedBox(
                            height: 265,
                          ),
                          IconTextContainerBig(
                            icon: "assets/icons/search_grey.png",
                            text: "Search for News",
                          )
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
