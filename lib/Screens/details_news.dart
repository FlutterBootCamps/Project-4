import 'package:flutter/material.dart';
import 'package:games_app/models/news_data.dart';

class DetailsNews extends StatelessWidget {
  const DetailsNews({super.key, this.details});
  final NewsData? details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background color
      appBar: AppBar(
        backgroundColor: Colors.black, // Appbar background color
        leading: const BackButton(color: Colors.white), // Back button
        actions: [
          IconButton(icon: const Icon(Icons.text_increase,color: Colors.white), onPressed: () {}), // Increase text size button
          IconButton(icon: const Icon(Icons.bookmark_border,color: Colors.white), onPressed: () {}), // Bookmark button
          IconButton(icon: const Icon(Icons.edit,color: Colors.white), onPressed: () {}), // Edit button
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(details?.img??""),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.1),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset("images/tech.png"), // Tech image
                      const SizedBox(width: 6),
                      Text(
                        details?.field??"", // Field text
                        style: TextStyle(color: Color.fromARGB(255, 199, 180, 247), fontSize: 15,fontWeight: FontWeight.bold), // Field text style
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    details?.title??"", // Title text
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  CircleAvatar(backgroundImage: NetworkImage(details?.userImg??""),), // User avatar
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        details?.author??"", // Author text
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    details?.date??"", // Date text
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 10),
                  Image.asset("images/ftl.png"), // FTL image
                  const SizedBox(height: 40),
                  const Text(
                    'Summary', // Summary title
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    details?.summary??"", // Summary text
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Content', // Content title
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    details?.content??"", // Content text
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
