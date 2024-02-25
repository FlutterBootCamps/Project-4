import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_4/bloc/articles_bloc.dart';
import 'package:project_4/helper/extintion.dart';
import 'package:project_4/pages/feed_page/widgets/articles_cards.dart';

class ArticleDisplay extends StatelessWidget {
  const ArticleDisplay({super.key, required this.condition});
  final String condition;

  @override
  Widget build(BuildContext context) {
    context.read<ArticlesBloc>().add(LaudingDataEvent());
    final bloc = BlocProvider.of<ArticlesBloc>(context);

    return ListView(
      children: [
        Column(
          children: [
            SizedBox(
              height: context.getHeight() / 4.2,
              child: Swiper(
                  // autoplay: true,
                  controller: SwiperController(),
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Container(
                          width: context.getHeight() / 2,
                          child: Image.asset(
                            "assets/swiber.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                            top: 135,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "DJI • Jul 10, 2023",
                                style: GoogleFonts.inter(
                                  color:
                                      const Color.fromARGB(255, 184, 184, 184),
                                  textStyle: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            )),
                        Positioned(
                            top: 155,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "A month with DJI Mini 3 Pro",
                                style: GoogleFonts.inter(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                        const Positioned(
                            top: 160,
                            right: 20,
                            child: Icon(
                              Icons.arrow_outward,
                              color: Colors.white,
                              size: 30,
                            )),
                        Positioned(
                            top: 8,
                            right: 175,
                            child: Container(
                              height: 15,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromARGB(255, 30, 30, 30)),
                            )),
                      ],
                    );
                  },
                  itemCount: 3,
                  pagination: const SwiperPagination(
                    alignment: Alignment.topCenter,
                    builder: DotSwiperPaginationBuilder(
                      activeSize: 5,
                      size: 5,
                      activeColor: Color.fromARGB(255, 255, 255, 255),
                      color: Color.fromARGB(255, 156, 156, 156),
                    ),
                  )),
            ),
            Image.asset(
              "assets/Divider.png",
              width: context.getWidth(),
              fit: BoxFit.contain,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Stories",
                    style: GoogleFonts.inter(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "See all",
                    style: GoogleFonts.inter(
                      color: const Color.fromARGB(255, 136, 136, 136),
                      textStyle: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<ArticlesBloc, ArticlesState>(
              builder: (context, state) {
                if (State is ArticlesInitial || state is LoudeningState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FinishLoudeningState) {
                  return Column(
                    children: [
                      ...List.generate(
                        bloc.allData.length,
                        (index) {
                          if (bloc.allData[index].field.toLowerCase() ==
                              condition.toLowerCase()) {
                            return ArticlesCard(article: bloc.allData[index]);
                          }
                          return const SizedBox(
                            width: 1,
                          );
                        },
                      )
                    ],
                  );
                }
                return const Text("error");
              },
            )
          ],
        ),
      ],
    );
  }
}
