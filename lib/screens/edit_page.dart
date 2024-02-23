import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/article_bloc.dart';
import 'package:news_app/helpers/extensions/screen_helper.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/fonts.dart';
import 'package:news_app/widgets/text_box_header.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController summaryController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    titleController.text = article.title;
    summaryController.text = article.summary;
    contentController.text = article.content;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: secondaryBgNavBarColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset("assets/icons/back.png")),
        actions: [
          BlocConsumer<ArticleBloc, ArticleState>(
            listener: (context, state) {
              if (state is EditedArticleState) {
                context.showSnackBar(context, state.message, limeGreenColor);
                Navigator.pop(context);
              } else if (state is EditedArticleErrorState) {
                context.showSnackBar(context, state.message, selectedTabColor);
              }
            },
            builder: (context, state) {
              return TextButton(
                  onPressed: () {
                    context.read<ArticleBloc>().add(EditArticleEvent(
                        article,
                        titleController.text,
                        summaryController.text,
                        contentController.text));
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(
                        color: whiteColor,
                        fontFamily: mainFont,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 29,
            ),
            TextBoxHeader(
              title: "Title",
              controller: titleController,
              maxLines: 3,
            ),
            const SizedBox(
              height: 29,
            ),
            TextBoxHeader(
              title: "Summary",
              controller: summaryController,
              maxLines: 3,
            ),
            const SizedBox(
              height: 29,
            ),
            TextBoxHeader(
              title: "Content",
              controller: contentController,
              maxLines: 24,
            ),
          ],
        ),
      ),
    );
  }
}
