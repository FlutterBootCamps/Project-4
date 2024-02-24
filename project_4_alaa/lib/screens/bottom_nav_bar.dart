import 'package:flutter/material.dart';
import 'package:project_4_alaa/constant/color.dart';
import 'package:project_4_alaa/screens/edit_news_screen.dart';
import 'package:project_4_alaa/screens/home_screen.dart';
import 'package:project_4_alaa/screens/profile_screen.dart';
import 'package:project_4_alaa/screens/save_screen.dart';
import 'package:project_4_alaa/screens/detail_news_screen.dart';
import 'package:project_4_alaa/screens/explore_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentScreen = 0;

  List<Widget> screen = [
    const HomeScreen(),
    // const EditNewsScreen(),
    // const DetailNews(),
    ExploreScreen(),
    const SaveScreen(),
    
    
    
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: screen[currentScreen],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.8, color: bottomGrey),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BottomNavigationBar(
            backgroundColor: black,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: white,
            unselectedItemColor: bottomGrey,
            unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            selectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.featured_play_list_outlined, color: bottomGrey),
                  activeIcon:
                      Icon(Icons.featured_play_list_outlined, color: white),
                  label: "Feed"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore_outlined, color: bottomGrey),
                  activeIcon:
                      Icon(Icons.explore_outlined, color: white),
                  label: "Explore"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_border_outlined, color: bottomGrey),
                  activeIcon:
                      Icon(Icons.bookmark_border_outlined, color: white),
                  label: "Save"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded, color: bottomGrey),
                  activeIcon: Icon(Icons.person_outline_rounded, color: white),
                  label: "Profile"),
            ],
            currentIndex: currentScreen,
            onTap: (int index) {
              currentScreen = index;
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
