
import 'package:flutter/material.dart';

class FilterTabBar extends StatelessWidget {
  const FilterTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        initialIndex: 0,
        child: TabBar.secondary(dividerHeight: 100,indicatorWeight: 3,
          indicatorColor: Colors.redAccent.shade200,
          dividerColor: Color.fromRGBO(25, 25, 25, 1),
          labelColor: Colors.white,
          tabs: [
          Tab(text: "Tech"),
          Tab(text: "AI"),
          Tab(text: "Cloud"),
          Tab(text: "Robotics"),
          Tab(text: "IoT"),
          ],
        ));
  }
}
