import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_app/bloc/new_news_bloc.dart';


class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background color
      appBar: AppBar(
        backgroundColor: Colors.black, // Appbar background color
        
        title: Row(
          children: [
            Expanded(
             
              child: Center(
                child: Container(
                  width: 375,
                  height: 60, 
                  child: TextField(
                    controller: _searchController,
                    style: TextStyle(
                      color: Colors.white, // Input text color
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                        color: Colors.white54, // Hint text color
                      ),
                      fillColor: Colors.grey[800], // Search field background color
                      filled: true,
                      prefixIcon: Icon(Icons.search, color: Colors.white54, size: 20), // Increase search icon size slightly
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear, color: Colors.white54), // Change clear icon color
                        onPressed: () {
                          _searchController.clear();
                          BlocProvider.of<NewNewsBloc>(context).add(ClearSearchEvent());
                        },
                      ),
                    ),
                    onChanged: (value) {
                     
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
     
    );
  }
}
