import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/article_bloc.dart';
import 'package:news_app/helpers/extensions/screen_helper.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/screens/article_details_page.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/fonts.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.article,
  });
  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.push(context, ArticleDetails(article: article));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          width: context.getWidth(context),
          height: 137,
          color: bgAppBarColor,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(bottom: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 80,
                    height: 62,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                        image: DecorationImage(
                            image: AssetImage(article.img), fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: context.getWidth(context) * .64,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.author,
                          style: const TextStyle(
                              color: lilGreyColor,
                              fontFamily: mainFont,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          article.title,
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            color: textActiveColorAppBar,
                            fontFamily: mainFont,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 10,
                    child: Text(
                      "${article.date} • ${article.readingMinutes} min read",
                      style: const TextStyle(
                        color: textInactiveColorTabBar,
                        fontFamily: mainFont,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  BlocBuilder<ArticleBloc, ArticleState>(
                    builder: (context, state) {
                      return Expanded(
                        child: IconButton(
                          onPressed: () {
                            context.read<ArticleBloc>().add(SaveArticleEvent(article: article));
                          },
                          icon: Image.asset(
                            (article.isSaved)
                                ? "assets/icons/bookmark_small_enabled.png"
                                : "assets/icons/bookmark_small_disabled.png",
                          ),
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/icons/more.png"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
