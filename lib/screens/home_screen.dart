import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/bloc/news_bloc_bloc.dart';
import 'package:project4/widgets/news_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<NewsBlocBloc>().add(UpdateNewsEvent());
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1E1E1E),
          leading: SizedBox(height: 28,width: 28, child: Image.asset('assets/images/vector.png')),
          actions:  [
            SizedBox(height: 28,width: 28,child: Image.asset('assets/images/Icon_sea.png'),),
            SizedBox(height: 28,width: 28,child: Image.asset('assets/images/Icon_not.png'),),
          ],
          bottom: const TabBar(
            indicatorColor: Color(0xffDD403C),
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyle(color: Colors.white),
            tabs: [
              Tab(text: "Tech"),
              Tab(text: "AI"),
              Tab(text: "cybersecurity"),
              Tab(text: "IoT"),
            ],
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color(0xff111111),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: SizedBox(
                  height: 180,
                  width: 343,
                  child: Image.asset('assets/images/Card_1.png'),
                ),
              ),
              Container(
                height: 1,
                width: 343,
                color: const Color(0xffFFFFFF),
              ),
              Container(
                height: 34,
                width: 343,
                child: Row(
                  children: const [
                    Text(
                      "Top Stories",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "see all",
                      style: TextStyle(color: Color(0xff888888), fontSize: 12),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<NewsBlocBloc, NewsBlocState>(
                  builder: (context, state) {
                    if (state is NewsBlocInitial || state is UpdateNewsState) {
                      return const CircularProgressIndicator();
                    }
                    if (state is LastUpdateState) {
                      return SingleChildScrollView(
                        child: Column(
                          children: state.information
                              .map((e) => Column(
                                    children: [
                                      NewsCard(information: e),
                                      SizedBox(height: 12), // SizedBox with height 12
                                    ],
                                  ))
                              .toList(),
                        ),
                      );
                    }
                    return const Center(child: Text("ERROR"));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  // Widget _buildFilteredNewsCards(List<Widget> allNewsCards, String topic) {
  //   List<Widget> filteredNewsCards = allNewsCards.where((newsCard) {
  //     Information info = (newsCard as NewsCard).information;
  //     return info.field == topic;
  //   }).toList();

  //   return ListView.builder(
  //     itemCount: filteredNewsCards.length,
  //     itemBuilder: (context, index) {
  //       return Column(
  //         children: [
  //           filteredNewsCards[index],
  //           const SizedBox(height: 12),
  //         ],
  //       );
  //     },
  //   );
  // }

/* Expanded(
                child: TabBarView(
                  children: [
                    _buildFilteredNewsCards(allNewsCards, "technology"),
                    _buildFilteredNewsCards(allNewsCards, "AI"),
                    _buildFilteredNewsCards(allNewsCards, "Cloud"),
                    _buildFilteredNewsCards(allNewsCards, "Robotics"),
                    _buildFilteredNewsCards(allNewsCards, "IoT"),
                  ],
                ),
              ), */