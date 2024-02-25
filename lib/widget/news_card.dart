import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_app/Screens/details_news.dart';
import 'package:games_app/bloc/new_news_bloc.dart';
import 'package:games_app/models/news_data.dart';

class NewsCard extends StatelessWidget {
  final NewsData? data;

  const NewsCard({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check if data is null
    if (data == null) {
      return Container(); // Or an error interface, depending on your design
    }

    // BlocBuilder to check the favorite status in NewsBloc
    return BlocBuilder<NewNewsBloc, NewNewsState>(
      builder: (context, state) {
        // Check if the news is in favorites
        final isFavorite = state is NewssaveUpdated && state.save.contains(data);

        return InkWell(
          onTap: () {
            // Navigate to the details page when the card is tapped
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
              children: [
                Row(
                  children: <Widget>[
                    // Image
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
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Author
                          Text(
                            data?.author ?? "",
                            style: const TextStyle(
                              color: Color(0xffb8b8b8),
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 5),
                          // Title
                          Text(
                            data?.title ?? "",
                            style: const TextStyle(
                              color: Color(0xffe8e8e8),
                              fontWeight: FontWeight.bold,
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
                    // Date
                    Text(
                      data?.date ?? "",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    // Favorite button
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.bookmark : Icons.bookmark_border,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Send event to the Bloc to add or remove from favorites
                        if (isFavorite) {
                          context.read<NewNewsBloc>().add(RemoveFromSaveEvent(data!));
                        } else {
                          context.read<NewNewsBloc>().add(AddToSaveEvent(data!));
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
        );
      },
    );
  }
}
