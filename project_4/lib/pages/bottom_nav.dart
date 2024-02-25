import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_4/pages/explore_page/explore_page.dart';
import 'package:project_4/pages/feed_page/news_article.dart';
import 'package:project_4/pages/profile_page/profile_page.dart';
import 'package:project_4/pages/saved_page/saved_page.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;
  PageController? controllerPageView = PageController();
  List<Widget> screens = [
    NewsArticles(),
    ExplorePage(),
    const SavedPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SizedBox(
          height: 100,
          child: BottomNavigationBar(
            onTap: (indexOnTap) {
              selectedIndex = indexOnTap;
              setState(() {});
            },
            backgroundColor: const Color.fromARGB(250, 17, 17, 17),
            unselectedItemColor: const Color.fromARGB(255, 89, 89, 89),
            enableFeedback: false,
            iconSize: 30,
            currentIndex: selectedIndex,
            selectedItemColor: Colors.white,
            selectedLabelStyle: GoogleFonts.inter(
                fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
            unselectedLabelStyle: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 89, 89, 89)),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.receipt_long_rounded), label: "feed"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore_outlined), label: "Explore"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_border), label: "Saved"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_outlined), label: "Profile"),
            ],
          ),
        ),
        body: screens[selectedIndex]);
  }
}
