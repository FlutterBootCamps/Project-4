import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/article_bloc.dart';
import 'package:news_app/helpers/extensions/screen_helper.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/fonts.dart';
import 'package:news_app/utils/setup.dart';
import 'package:news_app/widgets/article_card.dart';

// This is the page where the user can view their saved articles, and can also access them and remove them from the list.
class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bgColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 28,
                ),
                const Padding(
                    padding: EdgeInsets.only(left: 7),
                    child: Text(
                      "Saved News",
                      style: TextStyle(
                          color: whiteColor,
                          fontFamily: mainFont,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 28,
                ),
                BlocConsumer<ArticleBloc, ArticleState>(
                  listener: (context, state) {
                    if (state is SaveArticleState) {
                      context.showSnackBar(context, state.message, state.color);
                    }
                  },
                  builder: (context, state) {
                    List<ArticleCard> list = getIt.getSavedArticleList();
                    if (list.isNotEmpty) {
                      return SizedBox(
                        width: context.getWidth(context),
                        height: context.getHeight(context) * .79,
                        child: ListView(
                          children: getIt.getSavedArticleList(),
                        ),
                      );
                    } else {
                      return SizedBox(
                        width: context.getWidth(context),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 294,
                            ),
                            Text(
                              "No news found",
                              style: TextStyle(
                                  color: lilGreyColor,
                                  fontFamily: mainFont,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
