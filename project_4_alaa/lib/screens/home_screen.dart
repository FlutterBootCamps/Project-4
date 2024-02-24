import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4_alaa/bloc/news_bloc.dart';
import 'package:project_4_alaa/constant/color.dart';
import 'package:project_4_alaa/constant/space.dart';
import 'package:project_4_alaa/helper/screen_helper.dart';
import 'package:project_4_alaa/screens/explore_screen.dart';
import 'package:project_4_alaa/widgets/field_filter_widget.dart';
import 'package:project_4_alaa/widgets/silder_image_widget.dart';
import 'package:project_4_alaa/widgets/subheader_home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NewsBloc>(context);

    bloc.add(FetchAllNewsEvent());

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorColor: red,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: darkGrey,
            labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: white),
            labelPadding: EdgeInsets.symmetric(horizontal:20),
            unselectedLabelStyle:
                TextStyle(color: grey, fontSize: 14, fontWeight: FontWeight.w500),
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
                      const subtitle(),
                      
                      const FieldFilterWidget(fieldName: "technology"),
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
