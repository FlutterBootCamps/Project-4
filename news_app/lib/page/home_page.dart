import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/component/news_row_card.dart';
import 'package:news_app/page/const_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../component/lest_generate.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Tab> listFilter = <Tab>[
    const Tab(text: "AI"),
    const Tab(text: "Tech"),
    const Tab(text: "Cloud"),
    const Tab(text: "Robotics"),
    const Tab(text: "IoT"),
    const Tab(text: "Cybersecurity"),
  ];

  @override
  Widget build(BuildContext context) {
    context.read<NewsBloc>().add(FilterEvent());

    var controller;
    controller = PageController(
      viewportFraction: 0.8,
    );
    return DefaultTabController(
      length: listFilter.length,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
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
                dividerColor: const Color.fromRGBO(30, 30, 30, 1),
                labelColor: Colors.white,
                tabs: listFilter,
                isScrollable: true),
          ),
          body: Container(
            color: const Color.fromRGBO(17, 17, 17, 1),
            padding: const EdgeInsets.all(16.0),
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
                child: Column(children: [
              Container(
                child: Stack(children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                        "https://www.pluralsight.com/content/dam/ps/images/resource-center/blog/header-hero-images/ChatGPT-being-Yoda.resize.842.jpg"),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                  news: "Adam Ipsen • Aug 01, 2023",
                                  color: unselectColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                              CustomText(
                                  news:
                                      "ChatGPT Custom Instructions: Get ChatGPT to remember you",
                                  color: iconColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700)
                            ],
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Icon(
                            Icons.arrow_outward,
                            color: iconColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.35,
                    child: Container(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        onDotClicked: (index) {},
                      ),
                    ),
                  )
                ]),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Top Stories",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
                  )
                ],
              ),
              ListGenerate(listFilter: listFilter),
            ])),
          ),
        ),
      ),
    );
  }
}
