import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:project_4/bloc/news_bloc_bloc.dart';
import 'package:project_4/constant/color.dart';
import 'package:project_4/models/news_model.dart';
import 'package:project_4/widgets/card_widget.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NewsBlocBloc>().add(InitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBlack,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            TextField(
              onChanged: (value) {
                context
                    .read<NewsBlocBloc>()
                    .add(SearchEnevt(searchWord: value));
              },
              decoration: InputDecoration(
                hintText: "Search for News",
                hintStyle: TextStyle(color: whiColor),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(12),
                  child: const Iconify(
                    Bi.search,
                    color: Colors.white,
                  ),
                ),
                filled: true,
                fillColor: backgroundAppBar,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            BlocBuilder<NewsBlocBloc, NewsBlocState>(
              builder: (context, state) {
                if (state is SuccessState) {
                  if (state.list.isEmpty) {
                    return Expanded(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Iconify(
                              Bi.search,
                              color: whiColor,
                              size: 30,
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Text(
                              "Search for a news",
                              style: TextStyle(color: whiColor, fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (NewsModel news in state.list)
                              CadrWidget(news: news)
                          ],
                        ),
                      ),
                    );
                  }
                } else {
                  return Text("Error");
                }
              },
            )
          ]),
        ),
      ),
    );
  }
}
