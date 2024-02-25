import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_4/bloc/articles_bloc.dart';
import 'package:project_4/helper/extintion.dart';
import 'package:project_4/model/articles_model.dart';
import 'package:project_4/pages/feed_page/article_display.dart';

class SavedArticlesCard extends StatelessWidget {
  const SavedArticlesCard({super.key, required this.article});
  final ArticleData article;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ArticlesBloc>(context);
    bool isSave = bloc.save.contains(article);
    return InkWell(
      onTap: () {
        context.pushTo(
            view: ArticleDisplayPage(
          article: article,
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: context.getHeight() / 7,
        width: context.getWidth(),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 30, 30, 30),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    article.img,
                    height: context.getWidth() / 5,
                    width: context.getWidth() / 5,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.author,
                      style: GoogleFonts.inter(
                        color: const Color.fromARGB(255, 184, 184, 184),
                        textStyle: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: context.getWidth() / 1.6,
                      child: Text(
                        article.title,
                        style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      article.date,
                      style: GoogleFonts.inter(
                        color: const Color.fromARGB(255, 136, 136, 136),
                        textStyle: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 4,
                      width: 4,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 136, 136, 136)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${article.readingMinutes} min read ",
                      style: GoogleFonts.inter(
                        color: const Color.fromARGB(255, 136, 136, 136),
                        textStyle: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context
                            .read<ArticlesBloc>()
                            .add(RemoveSavesDataEvent(article: article));
                      },
                      child: isSave
                          ? const Icon(Icons.bookmark, color: Colors.white)
                          : const Icon(
                              Icons.bookmark_border,
                              color: Color.fromARGB(255, 136, 136, 136),
                            ),
                    ),
                    const Icon(
                      Icons.more_vert_rounded,
                      color: Color.fromARGB(255, 136, 136, 136),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
