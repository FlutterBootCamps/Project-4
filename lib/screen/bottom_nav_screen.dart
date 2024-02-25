import 'package:flutter/material.dart';
import 'package:project4/screen/account_screen.dart';
import 'package:project4/screen/explore_screen.dart';
import 'package:project4/screen/home_screen.dart';
import 'package:project4/screen/save_screen.dart';

class BottomNavScreen extends StatefulWidget {
  BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectIndex = 0;

  List screen = [
    HomeScreen(),
    ExploreScreen(),
    SaveScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[selectIndex],
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      bottomNavigationBar: Container(
        height: 88,
        width: 375,
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed, // Fixed
            backgroundColor: Color(0xff111111),
            unselectedItemColor: Color(0xff595959),
            selectedItemColor: Color(0xffFFFFFF),
            onTap: (index) {
              // Update the selected index when a tab is tapped
              selectIndex = index;
              setState(() {});
            },
            currentIndex: selectIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset('assets/Vectorr.png'), label: 'Feed'),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/Vectorr (1).png'), label: 'Explor'),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/Vector (2).png'), label: 'Saved'),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/Vector (3).png'), label: 'Profile'),
            ]),
      ),
    );
  }
}
