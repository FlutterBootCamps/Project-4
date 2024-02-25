import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  SearchWidgetState createState() => SearchWidgetState();
}

class SearchWidgetState extends State<SearchWidget> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
      child: Row(
        children: [
        
          IconButton(onPressed:(){}, icon: const Icon(Icons.menu,color: Colors.white,size: 40),),
         
          const SizedBox(width:240),
          IconButton(onPressed:(){}, icon: const Icon(Icons.search,color: Colors.white,size: 40),),
            
              IconButton(onPressed:(){}, icon: const Icon(Icons.notification_add_outlined,color: Colors.white,size: 40),),
        ],
      ),
    );
  }
}



