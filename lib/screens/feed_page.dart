import 'package:flutter/material.dart';
import 'package:news_app/helpers/extensions/screen_helper.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/fonts.dart';
import 'package:news_app/utils/setup.dart';
import 'package:news_app/widgets/article_card.dart';
import 'package:news_app/widgets/header_bar.dart';
import 'package:news_app/widgets/main_articleContainer.dart';


class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: DefaultTabController(
              length: 5,
              child: TabBar(
                  onTap: (index) {},
                  dividerColor: textInactiveColorTabBar,
                  indicatorColor: selectedTabColor,
                  indicatorWeight: 3,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: const TextStyle(
                      color: whiteColor,
                      fontFamily: mainFont,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                  unselectedLabelStyle: const TextStyle(
                      color: textInactiveColorTabBar,
                      fontFamily: mainFont,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  tabs: const [
                    Tab(
                      text: "Tech",
                    ),
                    Tab(
                      text: "AI",
                    ),
                    Tab(
                      text: "Cloud",
                    ),
                    Tab(
                      text: "Robotics",
                    ),
                    Tab(
                      text: "IoT",
                    ),
                  ]),
            ),
          ),
          backgroundColor: bgAppBarColor,
          leading: IconButton(
              onPressed: () {}, icon: Image.asset("assets/icons/list.png")),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset("assets/icons/search.png"),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset("assets/icons/notification.png"),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const MainArticleContainer(
                userName: "DJI",
                date: "Jul, 2023",
                headerText: "A month with DJI Mini 3 Pro",
                image: "assets/images/drone.png",
              ),
              const Divider(
                color: dividerColor2,
                thickness: 1,
                height: 24,
              ),
              HeaderBar(
                headerText: "Top Stories",
                seeAllOnTap: () {},
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                height: context.getHeight(context) * .42,
                child: ListView.builder(itemBuilder: (context, index) {
                  return ArticleCard(article: getIt.articleList[index]);
                },itemCount: getIt.articleList.length, ),
              )
            ],
          ),
        ));
  }
}

