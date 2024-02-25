import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:project_4/constant/color.dart';
import 'package:project_4/constant/color.dart';
import 'package:project_4/models/news_model.dart';
import 'package:project_4/pages/edit_page.dart';
import 'package:project_4/pages/home_page.dart';
import 'package:project_4/widgets/social_media_aicons.dart';

class NewsPage extends StatelessWidget {
  NewsPage({super.key, required this.news});
  NewsModel news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBlack,
      appBar: AppBar(
          backgroundColor: backgroundBlack,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: whiteColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Image.asset(
              'assets/images/Aa.png',
              width: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.bookmark_border_outlined,
                size: 35,
                color: whiteColor,
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditPage(
                        news: news,
                      ),
                    ),
                  );
                },
                icon: Image.asset(
                  'assets/images/edit.png',
                  width: 44,
                ))
          ]),
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.network(news.img!),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/tech.png'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    news.field!,
                    style: TextStyle(
                        fontSize: 15,
                        color: purbleColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Text(
                news.title!,
                style: TextStyle(
                    fontSize: 20,
                    color: whiteColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Image.asset('assets/images/person.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                news.author!,
                style: TextStyle(fontSize: 15, color: whitegreyColor),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${news.readingMinutes} min read • ${news.date}",
                style: TextStyle(fontSize: 12, color: greyColor),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SocialMedia(icon: 'assets/images/facebook.png'),
                  SocialMedia(icon: 'assets/images/twitter.png'),
                  SocialMedia(icon: 'assets/images/link.png')
                ],
              ),
              Text(
                "Summary",
                style: TextStyle(fontSize: 16, color: whiteColor),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                news.summary!,
                style: TextStyle(fontSize: 14, color: whitegreyColor),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Content",
                style: TextStyle(fontSize: 16, color: whiteColor),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                news.content!,
                style: TextStyle(fontSize: 14, color: whitegreyColor),
              )
            ],
          ),
        ),
      ])),
    );
  }
}
