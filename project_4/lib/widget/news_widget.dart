import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_app/Screens/news.dart';
import 'package:games_app/bloc/news_bloc.dart';

import 'package:games_app/models/news_data.dart';

class NewsCard extends StatelessWidget {
  final NewsData? data;

  const NewsCard({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     if (data == null) {
      return Container(); 
    }
    
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        
        final isFavorite = state is NewsFavoritesUpdated && state.favorites.contains(data);

        return Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailsNews(details: data),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color(0xff1e1e1e),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                           Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff1e1e1e), 
                          borderRadius: BorderRadius.circular(10),
                        ),
                        clipBehavior: Clip.antiAlias,
                        height: 80,
                        width: 120,
                        child: Image.network(
                          data?.img ?? "",
                          fit: BoxFit.cover,
                        )),
                    const SizedBox(width: 10), 
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            data?.author ?? "",
                            style: const TextStyle(
                              color: Color(0xffb8b8b8), 
                              fontSize: 12, 
                            ),
                          ),
                          Text(
                            data?.title ?? "",
                            style: const TextStyle(
                              color: Color(0xffe8e8e8), 
                              fontWeight:
                                  FontWeight.bold, 
                              fontSize: 16, 
                            ),
                          ),
                        ],
                      ),
                    ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                           Text(
                      data?.date ?? "",
                      style: const TextStyle(
                        color: Colors.grey, 
                        fontSize: 12, 
                      ),
                    ),
                        const Spacer(),
                        IconButton(
                          icon: Icon(
                            isFavorite ? Icons.bookmark : Icons.bookmark_border,
                            color:  Colors.white,
                          ),
                          onPressed: () {
                            
                            if (isFavorite) {
                              context.read<NewsBloc>().add(RemoveFromFavoritesEvent(data!));
                            } else {
                              context.read<NewsBloc>().add(AddToFavoritesEvent(data!));
                            }
                          },
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.more_vert,
                          color: Color(0xff888888),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

