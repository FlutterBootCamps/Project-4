import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4_alaa/bloc/news_bloc.dart';
import 'package:project_4_alaa/constant/color.dart';
import 'package:project_4_alaa/constant/space.dart';
import 'package:project_4_alaa/helper/screen_helper.dart';
import 'package:project_4_alaa/screens/explore_screen.dart';
import 'package:project_4_alaa/widgets/field_filter_widget.dart';
import 'package:project_4_alaa/widgets/silder_image_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NewsBloc>(context);

    bloc.add(FetchAllNewsEvent());

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          backgroundColor: cardGrey,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                tooltip: 'Menu',
                icon: Image.asset('asset/images/menu_icon.png'),
                onPressed: () {},
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context.pushTo(view: ExploreScreen());
                      },
                      icon: const Icon(Icons.search, color: white)),
                  width8,
                  Image.asset("asset/images/notification_icon.png"),
                ],
              )
            ],
          ),
          bottom: const TabBar(
            indicatorColor: red,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: darkGrey,
            // labelStyle: TextStyle(fontWeight: FontWeight.w400, color: white),
            labelPadding: EdgeInsets.all(0),
                              labelStyle: const TextStyle(
                      color: white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                       unselectedLabelStyle: const TextStyle(
                      color: grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w300),

            tabs: [
              Tab(text: "Tech"),
              Tab(text: "AI"),
              Tab(text: "Cloud"),
              Tab(text: "Cybersecurity"),
              Tab(text: "IoT"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ListView(
                children: [
                  Column(
                    children: [
                      const SliderImageWidget(),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: darkGrey, width: 2))),
                      ),
                      height32,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Top Stories",
                            style: TextStyle(
                                color: white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                                color: grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      // height24,

                       const FieldFilterWidget(fieldName:  "technology"),
                    ],
                  ),
                ],
              ),
            ),
            const FieldFilterWidget(fieldName: "AI"),
            const FieldFilterWidget(fieldName: "Cloud"),
            const FieldFilterWidget(fieldName: "Cybersecurity"),
            const FieldFilterWidget(fieldName: "IoT"),
          ],
        ),
      ),
    );
  }
}
