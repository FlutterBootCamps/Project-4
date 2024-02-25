import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_4/bloc/articles_bloc.dart';
import 'package:project_4/helper/extintion.dart';
import 'package:project_4/model/articles_model.dart';
import 'package:project_4/pages/feed_page/edit_article_page.dart';

// ignore: must_be_immutable
class ArticleDisplayPage extends StatelessWidget {
  ArticleDisplayPage({super.key, required this.article});
  ArticleData article;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ArticlesBloc>(context);
    bool isSave = bloc.save.contains(article);
    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state) {
        if (state is ChangeSaveState) {
          List.generate(
              bloc.allData.length,
              (index) => {
                    if (bloc.allData[index].userID == article.userID)
                      {
                        article = bloc.allData[index],
                      },
                  });
        }
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 30, 30, 30),
            actions: [
              Image.asset("assets/Back.png"),
              const SizedBox(
                width: 5,
              ),
              BlocBuilder<ArticlesBloc, ArticlesState>(
                builder: (context, state) {
                  if (state is ChangeSaveState) {
                    isSave = bloc.save.contains(article);
                  }
                  isSave = bloc.save.contains(article);
                  return InkWell(
                    onTap: () {
                      context
                          .read<ArticlesBloc>()
                          .add(SavingDataEvent(article: article));
                    },
                    child: isSave
                        ? const Icon(
                            Icons.bookmark,
                            color: Colors.white,
                            size: 30,
                          )
                        : const Icon(
                            Icons.bookmark_border,
                            color: Colors.white,
                            size: 30,
                          ),
                  );
                },
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                  onTap: () {
                    context.pushTo(
                        view: EditArticle(
                      article: article,
                    ));
                  },
                  child: Image.asset("assets/editpin.png")),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 18, 18, 18),
          body: ListView(
            children: [
              Image.asset(
                article.img,
                height: context.getHeight() / 3,
                width: context.getWidth(),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/Frame.png",
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          article.field,
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 189, 166, 245)),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      article.title,
                      style: GoogleFonts.inter(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: context.getWidth() / 9,
                      width: context.getWidth() / 9,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          article.userImg,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      article.author,
                      style: GoogleFonts.inter(
                        color: const Color.fromARGB(255, 184, 184, 184),
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          "${article.readingMinutes} min read ",
                          style: GoogleFonts.inter(
                            color: const Color.fromARGB(255, 136, 136, 136),
                            textStyle: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
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
                          article.date,
                          style: GoogleFonts.inter(
                            color: Color.fromARGB(255, 136, 136, 136),
                            textStyle: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Image.asset(
                      "assets/icons.png",
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "summary",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      article.summary,
                      style: GoogleFonts.inter(
                        color: Color.fromARGB(255, 184, 184, 184),
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "content",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      article.content,
                      style: GoogleFonts.inter(
                        color: Color.fromARGB(255, 184, 184, 184),
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      // softWrap: false,
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
