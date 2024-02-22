import 'package:flutter/material.dart';

import 'model/news_model.dart';

class NewsRowCard extends StatelessWidget {
  const NewsRowCard({
    super.key,
    required this.newsModel,
  });
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        color: const Color.fromRGBO(30, 30, 30, 1),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network(
                    newsModel.img,
                    height: 100,
                    width: 150,
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newsModel.author,
                        softWrap: false,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                      Text(newsModel.title,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white, fontSize: 15))
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(newsModel.date,
                      style: TextStyle(fontSize: 20, color: Colors.amber)),
                  Row(
                    children: [
                      Icon(Icons.bookmark),
                      Icon(Icons.more_vert_outlined)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
