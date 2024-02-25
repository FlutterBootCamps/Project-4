import 'package:flutter/material.dart';
import 'package:games_app/Screens/explore_page.dart';
import 'package:games_app/Screens/feed_page.dart';
import 'package:games_app/Screens/profile_page.dart';
import 'package:games_app/Screens/save.dart';

class NavBottom extends StatefulWidget {
  const NavBottom({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavBottomState createState() => _NavBottomState();
}

class _NavBottomState extends State<NavBottom> {
  
  int _selectedIndex = 0;

  final List<Widget> _pages = [
     FeedPage(),
     ExplorePage(),
     save(),
     ProfilePage(),
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
        type: BottomNavigationBarType.fixed,
         backgroundColor: const Color(0xff121212),
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
        selectedItemColor: Colors.white,
      
        unselectedItemColor: Color(0xff595959), // Change the color of inactive items
        onTap: _onItemTapped,
      ),
    );
  }
}
