import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4_alaa/bloc/news_bloc.dart';
import 'package:project_4_alaa/constant/color.dart';
import 'package:project_4_alaa/model/news_model.dart';

class SaveIcon extends StatelessWidget {
  const SaveIcon({super.key, required this.allNews, this.onPressedSave});
  final NewsModel allNews;
  final Function()? onPressedSave;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPressedSave != null) {
          onPressedSave!();
        }
        BlocProvider.of<NewsBloc>(context).add(SaveNewsEvent(
          savedNews: allNews,
        ));
      },
      child: Icon(
        allNews.isSaved ? Icons.bookmark : Icons.bookmark_border_rounded,
        color: allNews.isSaved ? white : grey,
      ),
    );
  }
}
