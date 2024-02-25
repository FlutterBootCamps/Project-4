import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/bloc/saved_bloc/bloc/saved_bloc_bloc.dart';
import 'package:project_4/constant/color.dart';
import 'package:project_4/models/news_model.dart';
import 'package:project_4/widgets/card_widget.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBlack,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Saved News",
                style: TextStyle(
                    fontSize: 20,
                    color: whiteColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<SavedBlocBloc, SavedBlocState>(
                builder: (context, state) {
                  if (state is SuccessState) {
                    if (state.list.isEmpty) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            "No news found",
                            style: TextStyle(color: whiColor, fontSize: 24),
                          ),
                        ),
                      );
                    } else {
                      return Expanded(
                        child: ListView(
                          children: [
                            for (NewsModel news in state.list)
                              CadrWidget(news: news)
                          ],
                        ),
                      );
                    }
                  } else {
                    return Text("error");
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
