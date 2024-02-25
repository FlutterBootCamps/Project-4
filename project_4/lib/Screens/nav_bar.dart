import 'package:flutter/material.dart';
import 'package:games_app/Screens/explore.dart';
import 'package:games_app/Screens/feed_b.dart';
import 'package:games_app/Screens/profile_page.dart';
import 'package:games_app/Screens/Fav.dart';

class NavBottom extends StatefulWidget {
  const NavBottom({super.key});

  @override
  _NavBottomState createState() => _NavBottomState();
}
class _NavBottomState extends State<NavBottom> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const FeedPage(),
    const ExplorePage(),
     Favorites(),
    const ProfilePage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',

          ),
          
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        backgroundColor: Colors.black, 
        unselectedItemColor: Colors.black, 
        onTap: _onItemTapped,
      ),
    );
  }
}
