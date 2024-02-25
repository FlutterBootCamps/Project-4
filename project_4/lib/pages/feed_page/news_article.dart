import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_4/helper/extintion.dart';
import 'package:project_4/pages/explore_page/explore_page.dart';
import 'package:project_4/pages/feed_page/widgets/articles_display_cards.dart';

class NewsArticles extends StatefulWidget {
  NewsArticles({super.key});

  @override
  State<NewsArticles> createState() => _NewsArticlesState();
}

class _NewsArticlesState extends State<NewsArticles>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        leading: Image.asset("assets/menue.png"),
        actions: [
          InkWell(
            onTap: () {
              context.pushTo(view: ExplorePage());
            },
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Image.asset("assets/notafication.png"),
          const SizedBox(
            width: 5,
          ),
        ],
        bottom: TabBar(
          labelColor: Color.fromARGB(255, 255, 255, 255),
          labelStyle: GoogleFonts.inter(
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          unselectedLabelColor: Color.fromARGB(255, 136, 136, 136),
          indicatorColor: Color.fromARGB(255, 221, 63, 60),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 3,
          controller: _tabController,
          labelPadding: EdgeInsets.symmetric(horizontal: 0.0),
          onTap: (value) {
          },
          tabs: [
            Tab(
                child: Text(
              "Tech",
              style: GoogleFonts.inter(
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            )),
            Tab(
                child: Text(
              "AI",
              style: GoogleFonts.inter(
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            )),
            Tab(
                child: Text(
              "Cloud",
              style: GoogleFonts.inter(
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            )),
            Tab(
                child: Text(
              "Robotics",
              style: GoogleFonts.inter(
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            )),
            Tab(
                child: Text(
              "CYS",
              style: GoogleFonts.inter(
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            )),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 18, 18, 18),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TabBarView(
          controller: _tabController,
          children: const [
            ArticleDisplay(condition: "technology"),
            ArticleDisplay(condition: "AI"),
            ArticleDisplay(condition: "Cloud"),
            ArticleDisplay(condition: " "),
            ArticleDisplay(condition: "Cybersecurity"),
          ],
        ),
      ),
    );
  }
}
