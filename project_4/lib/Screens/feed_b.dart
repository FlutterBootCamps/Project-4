import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_app/bloc/news_bloc.dart';
import 'package:games_app/helper/filter.dart';
import 'package:games_app/widget/news_widget.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    context.read<NewsBloc>().add(LoadEvent());
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.white, size: 35),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white, size: 35),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.notification_add_outlined,
                    color: Colors.white, size: 35),
                onPressed: () {},
              ),
            ],
            backgroundColor: const Color(0xFF1E1E1E),
            bottom: const TabBar(
                labelPadding: EdgeInsets.all(10),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 4,
                indicatorColor: Colors.red,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "Tech"),
                  Tab(text: "  AI"),
                  Tab(text: "Cloud"),
                  Tab(text: "Cyber"),
                ]),
          ),
          body:  Padding(
            padding: const EdgeInsets.all(17),
            child: SingleChildScrollView(
              child: Center(
                  child: Column(
                children: [
                  const fillter(), 
                  
                  BlocBuilder<NewsBloc, NewsState>(
                    builder: (context, state) {
                      if(state is NewsInitial|| state is LoadingState){
                        return const Center(child: CircularProgressIndicator());
                      }
                      else if(state is SuccessState){
                         return Column(
                           children: [
                            ...state.newslist.map((e) => NewsCard(data: e,)).toList()
                           ],
                         );
                      }else{
                        return Text("Data Invaild");
                      }
                   
                    },
                  )
                ],
              )),
            ),
          )),
    );
  }
}
