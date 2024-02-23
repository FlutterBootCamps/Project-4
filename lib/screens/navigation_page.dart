import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/navigation_bloc.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/fonts.dart';
import 'package:news_app/utils/setup.dart';

// This is the page where the user can navigate through the main 4 pages, FeedPage, ExplorePage, SavedPage, and ProfilePage.
class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: bgColor,
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: dividerColor,
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignInside))),
              child: BottomNavigationBar(
                  onTap: (index) {
                    context
                        .read<NavigationBloc>()
                        .add(ChangePageEvent(pageIndex: index));
                  },
                  type: BottomNavigationBarType.fixed,
                  currentIndex: getIt.currentPageIndex,
                  selectedItemColor: textActiveColorAppBar,
                  unselectedItemColor: textInactiveColorAppBar,
                  selectedLabelStyle: const TextStyle(
                      fontFamily: mainFont,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                  unselectedLabelStyle: const TextStyle(
                      fontFamily: mainFont,
                      fontSize: 10,
                      fontWeight: FontWeight.w600),
                  backgroundColor: bgNavBarColor,
                  items: [
                    BottomNavigationBarItem(
                        label: "Feed",
                        activeIcon:
                            Image.asset("assets/icons/newspaper_enabled.png"),
                        icon:
                            Image.asset("assets/icons/newspaper_disabled.png")),
                    BottomNavigationBarItem(
                        label: "Explore",
                        activeIcon:
                            Image.asset("assets/icons/compass_enabled.png"),
                        icon: Image.asset("assets/icons/compass_disabled.png")),
                    BottomNavigationBarItem(
                        label: "Saved",
                        activeIcon:
                            Image.asset("assets/icons/bookmark_enabled.png"),
                        icon:
                            Image.asset("assets/icons/bookmark_disabled.png")),
                    BottomNavigationBarItem(
                        label: "Profile",
                        activeIcon:
                            Image.asset("assets/icons/profile_enabled.png"),
                        icon: Image.asset("assets/icons/profile_disabled.png"))
                  ]),
            ),
            body: getIt.pageList[getIt.currentPageIndex],
          );
        },
      ),
    );
  }
}
