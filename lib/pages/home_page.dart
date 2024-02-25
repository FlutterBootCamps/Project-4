import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:project_4/bloc/news_bloc_bloc.dart';

import 'package:project_4/constant/color.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:project_4/models/news_model.dart';
import 'package:project_4/widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final List<String> tabTitles = [
    'Tech',
    'AI',
    'Cloud',
    'Robotics',
    'Cybersecurity',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NewsBlocBloc>().add(LoadingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundAppBar,
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/IconsList.png',
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Iconify(
                  Bi.search,
                  color: whiteColor,
                )),
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/IconsNotification.png',
                  width: 30,
                ))
          ],
          bottom: TabBar(
            tabs: tabTitles.map((title) => Tab(text: title)).toList(),
            onTap: (index) {
              context
                  .read<NewsBlocBloc>()
                  .add(FillteringEvent(field: tabTitles[index]));
            },
            labelColor: whiteColor,
            unselectedLabelColor: greyColor,
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: backgroundBlack,
        body: BlocBuilder<NewsBlocBloc, NewsBlocState>(
          builder: (context, state) {
            if (state is SuccessState) {
              return SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset('assets/images/drone.png'),
                            Positioned(
                              left: 20,
                              bottom: 30,
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "DJI • Jul 10, 2023",
                                        style: TextStyle(
                                            fontSize: 10, color: whiColor),
                                      ),
                                      Text(
                                        "A month with DJI Mini 3 Pro",
                                        style: TextStyle(
                                            color: whiteColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_outward_rounded,
                                        color: whiteColor,
                                        size: 30,
                                      ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 38,
                                      height: 14,
                                      decoration: BoxDecoration(
                                          color: Colors.black26,
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                    ),
                                    DotsIndicator(
                                      dotsCount: 3,
                                      position: 1,
                                      decorator: DotsDecorator(
                                        size: const Size.square(5.0),
                                        activeSize: const Size(12.0, 5.0),
                                        color: Colors.grey,
                                        activeColor: Colors.white,
                                        spacing: const EdgeInsets.symmetric(
                                            horizontal: 1.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(
                          thickness: 1,
                          color: greyColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Top Stories",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: whiteColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "See all",
                                  style: TextStyle(color: greyColor),
                                ))
                          ],
                        ),
                        for (int i = 0; i < state.list.length; i++)
                          CadrWidget(news: state.list[i])
                      ],
                    ),
                  )
                ]),
              );
            }
            if (state is LoadingState || state is NewsBlocInitial) {
              return CircularProgressIndicator();
            }
            return Text("Error");
          },
        ),
      ),
    );
  }
}
