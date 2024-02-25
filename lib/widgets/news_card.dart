import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/bloc/news_bloc_bloc.dart';
import 'package:project4/model/information.dart';
import 'package:project4/screens/details_screen.dart';

class NewsCard extends StatelessWidget {
  final Information information;

  const NewsCard({Key? key, required this.information}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(information: information),
          ),
        );
      },
      child: BlocBuilder<NewsBlocBloc, NewsBlocState>(
        builder: (context, state) {
          return Container(
            height: 130,
            width: 353,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xff1E1E1E),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        information.img.toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          information.author ?? '',
                          style: TextStyle(
                            color: Color(0xffB8B8B8),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          information.title ?? '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      information.date ?? '',
                      style: TextStyle(
                        color: Color(0xffB8B8B8),
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<NewsBlocBloc>(context)
                            .add(BookmarkEvent(information));
                      },
                      icon: Icon(
                        Icons.bookmark_border_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    SizedBox(width: 13),
                    Icon(
                      Icons.more_vert,
                      color: Colors.white,
                      size: 24,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
