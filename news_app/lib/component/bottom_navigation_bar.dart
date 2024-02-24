import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/page/home_page.dart';
import 'package:news_app/page/search_by_title.dart';
import 'package:news_app/page/saved_news.dart';

import '../page/profile_account.dart';

class BottomNavigationBarState extends StatefulWidget {
  const BottomNavigationBarState({Key? key}) : super(key: key);

  static final List<Widget> _pages = <Widget>[
    HomePage(),
    SearchByTitle(),
    SavedNews(),
    ProfilePage(),
  ];

  @override
  _BottomNavigationBarStateState createState() =>
      _BottomNavigationBarStateState();
}

class _BottomNavigationBarStateState extends State<BottomNavigationBarState> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BottomNavigationBarState._pages.elementAt(_selectedTab),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color.fromRGBO(17, 17, 17, 0.84),
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.white,
            currentIndex: _selectedTab,
            showUnselectedLabels: true,
            onTap: (value) {
              setState(() {
                _selectedTab = value;
              });
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icon/Icon=Feed.svg",
                    height: 24,
                    width: 24,
                  ),
                  label: "Feed",
                  backgroundColor: Color.fromRGBO(17, 17, 17, 0.84)),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icon/Icon=Explore.svg",
                    height: 24,
                    width: 24,
                  ),
                  label: "Explore",
                  backgroundColor: Color.fromRGBO(17, 17, 17, 0.84)),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icon/Icon=Save.svg",
                    height: 24,
                    width: 24,
                  ),
                  label: "Saved",
                  backgroundColor: Color.fromRGBO(17, 17, 17, 0.84)),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icon/Icon=User.svg",
                    height: 24,
                    width: 24,
                  ),
                  label: "Profile",
                  backgroundColor: Color.fromRGBO(17, 17, 17, 0.84)),
            ]));
  }
}
