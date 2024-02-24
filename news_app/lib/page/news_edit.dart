import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/component/news_row_card.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/page/const_color.dart';

class NewsEdit extends StatelessWidget {
  NewsEdit({super.key, required this.news});
  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    final TextEditingController title = TextEditingController();
    title.text = news.title;
    final TextEditingController summary = TextEditingController();
    summary.text = news.summary;
    final TextEditingController content = TextEditingController();
    content.text = news.content;
    return Scaffold(
        backgroundColor: bodyColor,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset("assets/icon/Icon=Chevron-Left.svg")),
          ),
          backgroundColor: appBarColor,
          actions: [
            TextButton(
                onPressed: () {
                  news.title = title.text;
                  news.summary = summary.text;
                  news.content = content.text;

                  BlocProvider.of<NewsBloc>(context)
                      .add(UpdateNews(news: news));
                },
                child: Text(
                  "Save",
                  style: TextStyle(color: iconColor),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomText(
                  news: "title",
                  color: iconColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
                TextFormField(
                  maxLines: 1,
                  style: TextStyle(color: iconColor),
                  controller: title,
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(255, 255, 255, 0.12),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                CustomText(
                  news: "Summary",
                  color: iconColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
                TextFormField(
                  maxLines: 3,
                  style: TextStyle(color: iconColor),
                  controller: summary,
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(255, 255, 255, 0.12),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                CustomText(
                  news: "Content",
                  color: iconColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
                TextField(
                  maxLines: 15,
                  style: TextStyle(color: iconColor),
                  controller: content,
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(255, 255, 255, 0.12),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
