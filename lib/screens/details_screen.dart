import 'package:flutter/material.dart';
import 'package:project4/model/information.dart';
import 'package:project4/screens/edit_screen.dart';

class DetailsScreen extends StatelessWidget {
  final Information information;

  const DetailsScreen({required this.information});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
            
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.text_fields,color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.bookmark_outline,color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.edit_outlined,color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditScreen(information: information),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/images/google.png',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      information.title.toString(),
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${information.author}',
                      style: TextStyle(fontSize: 16, color: Color(0xff888888)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${information.readingMinutes} min read • ${information.date}',
                      style: TextStyle(fontSize: 16, color: Color(0xff888888)),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "summary",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      information.summary.toString(),
                      style: TextStyle(fontSize: 14, color: Color(0xff888888)),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "content",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      information.content.toString(),
                      style: TextStyle(fontSize: 14, color: Color(0xff888888)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
