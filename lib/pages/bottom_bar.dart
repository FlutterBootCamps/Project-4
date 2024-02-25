import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:project_4/bloc/navigation_bloc/bloc/navigation_bloc.dart';
import 'package:project_4/constant/color.dart';
import 'package:project_4/pages/explore_page.dart';
import 'package:project_4/pages/home_page.dart';
import 'package:project_4/pages/profile_page.dart';
import 'package:project_4/pages/saved_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _pages = [
    const HomePage(),
    const ExplorePage(),
    const SavedPage(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        if (state is SuccessState) {
          return Scaffold(
              body: _pages[state.currentIndex],
              bottomNavigationBar: Container(
                child: BottomNavigationBar(
                  showUnselectedLabels: true,
                  currentIndex: state.currentIndex,
                  backgroundColor: backgroundBlack,
                  selectedItemColor: whiteColor,
                  unselectedItemColor: greyColor,
                  onTap: (index) {
                    context
                        .read<NavigationBloc>()
                        .add(ChangePageEvent(currentIndex: index));
                  },
                  items: [
                    BottomNavigationBarItem(
                      backgroundColor: backgroundBlack,
                      icon: Icon(Icons.feed),
                      label: ("Feed"),
                    ),
                    BottomNavigationBarItem(
                        backgroundColor: backgroundBlack,
                        icon: Icon(Icons.explore_outlined),
                        label: "Explore"),
                    BottomNavigationBarItem(
                        backgroundColor: backgroundBlack,
                        icon: Icon(Icons.bookmark_border_outlined),
                        label: "Saved"),
                    BottomNavigationBarItem(
                        backgroundColor: backgroundBlack,
                        icon: Icon(Icons.person),
                        label: "Profile")
                  ],
                ),
              ));
        }
        return Text("Error");
      },
    );
  }
}
