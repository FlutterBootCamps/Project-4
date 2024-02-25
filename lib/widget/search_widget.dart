import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  // Constructor for SearchWidget
  const SearchWidget({Key? key}) : super(key: key);

  @override
  SearchWidgetState createState() => SearchWidgetState();
}

class SearchWidgetState extends State<SearchWidget> {
  // Controller for search text field
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
      child: Row(
        children: [
          // Menu button
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.white, size: 40),
          ),
          // Spacer
          const SizedBox(width: 240),
          // Search button
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white, size: 40),
          ),
          // Notification button
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notification_add_outlined, color: Colors.white, size: 40),
          ),
        ],
      ),
    );
  }
}
