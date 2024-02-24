import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_4_saad_alharbi/bloc/blog_bloc.dart';
import 'package:project_4_saad_alharbi/extensions/screen_handler.dart';
import 'package:project_4_saad_alharbi/widgets/stories_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlogBloc>(context);
    String tapFelid= 'technology' ;

    bloc.add(LoadingEvent());

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: const Color(0xff1E1E1E),
          title: SvgPicture.asset(
            "assets/icons/Hamburger.svg",
            fit: BoxFit.contain,
            width: 30,
            height: 30,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "assets/icons/Search.svg",
                    height: 30,
                    width: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(
                    "assets/icons/Notification.svg",
                    height: 30,
                    width: 30,
                  ),
                ],
              ),
            )
          ],
          bottom: TabBar(
              onTap: (value) {
                switch (value) {
                  case 0:
                    tapFelid = "technology";
                    break;
                  case 1:
                    tapFelid = "AI";
                    break;
                  case 2:
                    tapFelid = "Cloud";
                    break;
                  case 3:
                    tapFelid = "Robotics";
                    break;
                  case 4:
                    tapFelid = "Cybersecurity";
                    break;
                  default:
                    tapFelid = "technology";
                }
                bloc.add(TapFieldEvent(tapFelid));
              },
              tabAlignment: TabAlignment.start,
              indicatorColor: const Color(0xffDD403C),
              indicatorSize: TabBarIndicatorSize.tab,
              isScrollable: true,
              indicatorWeight: 3,
              labelColor: Colors.white,
              labelStyle: const TextStyle(
                overflow: TextOverflow.fade,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelColor: const Color(0xff888888),
              dividerColor: const Color(0xff888888),
              tabs: const [
                Tab(
                  child: Text("Tech"),
                ),
                Tab(
                  child: Text("AI"),
                ),
                Tab(
                  child: Text("Cloud"),
                ),
                Tab(
                  child: Text("Robotics"),
                ),
                Tab(
                  child: Text("Cybersecurity"),
                ),
              ]),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 200,
                          child: Image.asset(
                            "assets/images/STK156.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "DJI • Jul 10, 2023",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 10,
                                ),
                              ),
                              const Text(
                                "A month with DJI Mini 3 Pro",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const Positioned(
                          right: 10,
                          bottom: 10,
                          child: Icon(
                            Icons.arrow_outward,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )),
                const Divider(
                  color: Color(0xff888888),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Stories",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(color: Color(0xff888888), fontSize: 13),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: context.getWidth(),
                  height: context.getWidth() / 1.25,
                  child: BlocBuilder<BlogBloc, BlogState>(
                    builder: (context, state) {
                      if (state is LoadingState || state is BlogInitial) {
                        tapFelid = 'technology';
                        return const SizedBox(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }
                      if (state is SuccessState) {
                        return ListView.builder(
                            itemCount: state.blogs.length,
                            itemBuilder: (context, index) {
                              if (state.blogs[index].field == tapFelid) {
                                return StoriesContainer(
                                  blogs: state.blogs[index],
                                  isSaved: state.savedList.contains(index),
                                  onPressed: () {
                                    bloc.add(SavedEvent(index: index));
                                  },
                                  index: index,
                                );
                              } else {
                                return Container();
                              }
                            });
                      }
                      return const Text(
                        "Error",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
