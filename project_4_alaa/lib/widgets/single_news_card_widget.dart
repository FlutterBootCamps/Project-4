import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4_alaa/bloc/news_bloc.dart';
import 'package:project_4_alaa/constant/color.dart';
import 'package:project_4_alaa/constant/space.dart';
import 'package:project_4_alaa/helper/screen_helper.dart';
import 'package:project_4_alaa/model/news_model.dart';
import 'package:project_4_alaa/screens/detail_news_screen.dart';
import 'package:project_4_alaa/widgets/save_icon_widegt.dart';

class SingleNewsCard extends StatelessWidget {
  const SingleNewsCard({
    super.key,
    required this.allNews,
     this.onPressedSave
  });
  final NewsModel allNews;
  final Function(NewsModel)? onPressedSave;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NewsBloc>(context);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: context.getWidth() * 0.95,
        height: context.getWidth() * 0.3,
        child: Container(
          decoration: const BoxDecoration(
            color: cardGrey,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        allNews.img,
                        fit: BoxFit.fill,
                        width: context.getWidth() * 0.25,
                        height: context.getWidth() * 0.2,
                      ),
                    ),
                    width8,
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            allNews.author,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: grey,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              context.pushTo(
                                  view: DetailNews(singleNews: allNews));
                            },
                            child: Text(
                              allNews.title,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // ),
                height5,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(allNews.date,
                        style: const TextStyle(fontSize: 12, color: grey)),
                    Row(
                      children: [
                        SaveIcon(allNews: allNews),
                       
                       
                        Image.asset("asset/images/other_icon.png"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
