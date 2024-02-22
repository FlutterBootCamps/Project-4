import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/news_row_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const List<Tab> listFilter = <Tab>[
    Tab(text: "Tech"),
    Tab(text: "AI"),
    Tab(text: "Cloud"),
    Tab(text: "Robotics"),
    Tab(text: "IoT"),
    Tab(text: "Cybersecurity"),
    Tab(
      text: "technology",
    )
  ];

  @override
  Widget build(BuildContext context) {
    context.read<NewsBloc>().add(LoadEvent());
    return DefaultTabController(
      length: listFilter.length,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(25, 25, 25, 1),
            leadingWidth: 44,
            leading: Container(
              margin: const EdgeInsets.only(left: 16),
              child: SvgPicture.asset(
                "assets/icon/Icon=Hamburger.svg",
                height: 28,
                width: 28,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/icon/Icon=Search.svg",
                  width: 28,
                  height: 28,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/icon/Icon=Notification.svg",
                  width: 28,
                  height: 28,
                ),
              )
            ],
            bottom: TabBar.secondary(
                onTap: (int index) {
                  BlocProvider.of<NewsBloc>(context)
                      .add(FilterEvent(index: index));
                },
                indicatorWeight: 3,
                indicatorColor: Colors.redAccent.shade200,
                dividerColor: const Color.fromRGBO(25, 25, 25, 1),
                labelColor: Colors.white,
                tabs: listFilter,
                isScrollable: true),
          ),
          body: Container(
            color: const Color.fromRGBO(17, 17, 17, 0.84),
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  width: 343,
                  height: 180,
                  color: Colors.indigo.shade900,
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Top Stories",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "See all",
                      style:
                          TextStyle(color: Colors.grey.shade500, fontSize: 10),
                    )
                  ],
                ),
                BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    if (state is ChangeState) {
                      return Column(
                        children: [
                          ...List.generate(
                              state.newsList.length,
                              (index) => listFilter[
                                              DefaultTabController.of(context)
                                                  .index]
                                          .text ==
                                      state.newsList[index].field
                                  ? NewsRowCard(
                                      newsModel: state.newsList[index],
                                    )
                                  : Container())
                        ],
                      );
                    }
                    return Container();
                  },
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
