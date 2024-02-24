import 'package:flutter/material.dart';
import 'package:news_app/component/book_mark.dart';
import 'package:news_app/extensions/screen_helper.dart';
import 'package:news_app/page/const_color.dart';
import 'package:news_app/page/news_details_page.dart';

import '../model/news_model.dart';

class NewsRowCard extends StatelessWidget {
  const NewsRowCard({
    super.key,
    required this.news,
  });
  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {context.pushTo(view:NewsDetailsPage(news:news))},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(30, 30, 30, 1),
              borderRadius: BorderRadius.circular(8)),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      news.img,
                      height: 90,
                      width: 150,
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    height: 90,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              news: news.author,
                              color: Color.fromRGBO(184, 184, 184, 1),
                              fontSize: 9,
                              fontWeight: FontWeight.w500),
                          CustomText(
                            news: news.title,
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      news: "${news.date} • ${news.readingMinutes} min read",
                      color: Colors.grey,
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                    ),
                    Row(
                      children: [
                        BookMark(news: news),
                        Icon(Icons.more_vert_outlined,color: iconColor,)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.news,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
  });
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final String news;

  @override
  Widget build(BuildContext context) {
    return Text(
      news,
      softWrap: false,
      maxLines: 20,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
