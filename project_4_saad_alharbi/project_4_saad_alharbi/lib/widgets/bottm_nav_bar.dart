import 'package:flutter/material.dart';
import 'package:project_4_saad_alharbi/screen/explore_screen.dart';
import 'package:project_4_saad_alharbi/screen/home_screen.dart';
import 'package:project_4_saad_alharbi/screen/profile_screen.dart';
import 'package:project_4_saad_alharbi/screen/saved_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const ExploreScreen(),
    const SavedScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff1E1E1E),
        type: BottomNavigationBarType.fixed,
        iconSize: 20,
        onTap: (value) {
          selectedIndex = value;
          setState(() {});
        },
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.white.withOpacity(0.2),
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.feed), label: 'Feed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border), label: 'Saved'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}
