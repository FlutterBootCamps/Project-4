import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4_alaa/bloc/news_bloc.dart';
import 'package:project_4_alaa/constant/space.dart';
import 'package:project_4_alaa/widgets/single_news_card_widget.dart';

class FieldFilterWidget extends StatelessWidget {
  const FieldFilterWidget({super.key, required this.fieldName});
  final String fieldName;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        height24,
        BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
          if (state is LoadingNewsState || state is NewsInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is DisplatNewsState) {
            return Wrap(
              children: [
                ...state.allNews.map((element) {
                  if (element.field == fieldName) {
                    return SingleNewsCard(allNews: element);
                  }
                  return const Text("");
                }),
              ],
            );
          }
          return const Text("Error Fetch News");
        }),
      ],
    );
  }
}
