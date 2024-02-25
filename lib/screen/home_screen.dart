import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:project4/bloc/app_bloc.dart';
import 'package:project4/widgets/container_widgets.dart';
import 'package:project4/widgets/tapbar_page.dart';
import 'package:project4/widgets/text_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AppBloc>().add(LoadEvent());
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1E1E1E),
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset('assets/Icons.png'),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/Icons (1).png'),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/hh.png'),
            ),
          ],
          bottom: TabBar(
            dividerColor: Color(0xff888888),
            labelPadding: EdgeInsets.all(1),
            indicatorColor: Color(0xffDD403C),
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Color(0xffFFFFFF),
            unselectedLabelColor: Color(0xff888888),
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            tabs: [
              Tab(text: 'Tech'),
              Tab(text: 'AI'),
              Tab(text: 'Cloud'),
              Tab(text: 'Robotics'),
              Tab(text: 'IoT'),
            ],
          ),
        ),
        backgroundColor: Color(0xff121212),
        body: TabBarView(
          children: [
            // List View
            ListView(
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  height: 200,
                  width: 343,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xff2C2C2C)),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Card(
                        color: Color(0xff1E1E1E),
                        child: ImageSlideshow(
                          width:
                              double.infinity, // Width of the [ImageSlideshow].
                          height: 180,
                          initialPage: 0,
                          indicatorBottomPadding: 157,
                          indicatorColor: Colors.white,
                          indicatorBackgroundColor: Colors
                              .grey, // The color to paint behind th indicator.
                          // The widgets to display in the [ImageSlideshow]
                          children: [
                            Image.asset(
                              'assets/STK156_Instagram_threads_2 1.png',
                              fit: BoxFit.fill,
                            ),
                            Image.asset(
                              'assets/STK156_Instagram_threads_2 1.png',
                              fit: BoxFit.fill,
                            ),
                            Image.asset(
                              'assets/STK156_Instagram_threads_2 1.png',
                              fit: BoxFit.fill,
                            ),
                          ],
                          // Called whenever the page in the center of the viewport changes.
                          onPageChanged: (value) {
                            print('Page changed: $value');
                          },
                          autoPlayInterval: 4000, // Auto scroll interval.
                          isLoop: false, // Loops back to first slide.
                        ),
                      ),
                      Positioned(
                          left: 20,
                          bottom: 50,
                          child: Text(
                            'DJI • Jul 10, 2023',
                            style: TextStyle(
                                color: Color(0xffB8B8B8), fontSize: 10),
                          )),
                      Positioned(
                          left: 20,
                          bottom: 25,
                          child: Text(
                            'A month with DJI Mini 3 Pro',
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                      Positioned(
                          right: 15,
                          bottom: 20,
                          child: IconButton(
                              onPressed: () {},
                              icon: Image.asset('assets/Frame.png'))),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      TextWidget(
                        text: 'Top Stories',
                        size: 16,
                      ),
                      SizedBox(
                        width: 245,
                      ),
                      Text(
                        'see all',
                        style:
                            TextStyle(color: Color(0xff888888), fontSize: 12),
                      )
                    ],
                  ),
                ),
                BlocBuilder<AppBloc, AppState>(
                  builder: (context, state) {
                    if (state is LoadingAppState || state is AppInitial) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is SuccessAppState) {
                      return Container(
                        child: Column(
                          children: [
                            ...List.generate(state.blogs.length, (index) {
                              return ContainerWidget(
                                blog: state.blogs[index],
                              );
                            }),
                          ],
                        ),
                      );
                    }
                    return Text('Error');
                  },
                ),
              ],
            ),
            TapbarPage(
              name: 'AI',
            ),
            TapbarPage(
              name: 'Cloud',
            ),
            TapbarPage(
              name: 'Robotics'
            ),
            TapbarPage(
              name: 'IoT',
            ),
          ],
        ),
      ),
    );
  }
}
