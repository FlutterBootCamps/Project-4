import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/component/book_mark.dart';
import 'package:news_app/component/news_row_card.dart';
import 'package:news_app/extensions/screen_helper.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/page/const_color.dart';
import 'package:news_app/page/news_edit.dart';

import '../bloc/news_bloc.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({super.key, required this.news});
  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(onTap:(){Navigator.pop(context);} ,child:SvgPicture.asset("assets/icon/Icon=Chevron-Left.svg") ),
              ),
              backgroundColor:appBarColor,

              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/icon/Icon=Font.svg",
                    width: 28,
                    height: 28,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BookMark(news: news)),
               IconButton(onPressed:() {
                 
              context.pushTo(view: NewsEdit(news:news));}, icon: const Icon(Icons.edit,color: Colors.white,)) 
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                color: bodyColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(news.img),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icon/Icon=Tech.svg",
                            width: 16,
                            height: 16,
                            color: filedColor,
                          ),
                          CustomText(
                            news: news.field,
                            color: filedColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CustomText(
                        news: news.title,
                        color: iconColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        height: 28,
                        width: 28,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          news.userImg,
                          fit: BoxFit.contain,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CustomText(
                        news: news.author,
                        color: const Color.fromRGBO(184, 184, 184, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16),
                      child: CustomText(
                        news: "${news.readingMinutes} min read• ${news.date}",
                        color: const Color.fromRGBO(136, 136, 136, 1),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16),
                      child: Image.asset("assets/icon/Frame 30.png"),
                    ),
                    const SizedBox(height: 30),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: CustomText(
                        news: "Summary",
                        color: Color.fromRGBO(232, 232, 232, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CustomText(
                        news: news.summary,
                        color: const Color.fromRGBO(184, 184, 184, 1),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: CustomText(
                        news: "Content",
                        color: Color.fromRGBO(232, 232, 232, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CustomText(
                        news: news.content,
                        color: const Color.fromRGBO(184, 184, 184, 1),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
