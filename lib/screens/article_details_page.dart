import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/article_bloc.dart';
import 'package:news_app/helpers/extensions/screen_helper.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/fonts.dart';
import 'package:news_app/widgets/icon_text_container.dart';
import 'package:news_app/widgets/social_media_bar.dart';
import 'package:news_app/widgets/text_section.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: exploreBgNavBarColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset("assets/icons/back.png")),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset("assets/icons/letter_sizing.png")),
          BlocBuilder<ArticleBloc, ArticleState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    context
                        .read<ArticleBloc>()
                        .add(SaveArticleEvent(article: article));
                  },
                  icon: Image.asset((article.isSaved)
                      ? "assets/icons/bookmark_white_enabled.png"
                      : "assets/icons/bookmark_white_disabled.png"));
            },
          ),
          IconButton(
              onPressed: () {}, icon: Image.asset("assets/icons/edit.png")),
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: context.getWidth(context),
            height: context.getHeight(context) * .35,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(article.img), fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconTextContainer(
                  icon: "assets/icons/${article.field.toLowerCase()}.png",
                  text: article.field.toUpperCase(),
                ),
                Text(
                  article.title,
                  style: const TextStyle(
                      color: whiteColor,
                      fontFamily: mainFont,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                ClipOval(
                  child: Image.asset(
                    article.userImg,
                    width: 28,
                    height: 28,
                    fit: BoxFit.cover,
                  ), //Used clipOval instead of circle avatar because the image sizing isn't available with circle avatar(background image).
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  article.author,
                  style: const TextStyle(
                      color: lilGreyColor,
                      fontFamily: mainFont,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "${article.readingMinutes} min read • ${article.date}",
                  style: const TextStyle(
                      color: textInactiveColorTabBar,
                      fontFamily: mainFont,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 12,
                ),
                const SocialMediaBar(
                  icons: [
                    "assets/icons/facebook.png",
                    "assets/icons/twitter.png",
                    "assets/icons/link.png",
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                TextSection(
                  title: "Summary",
                  text: article.summary,
                ),
                const SizedBox(
                  height: 40,
                ),
                TextSection(
                  title: "Content",
                  text: article.content,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

