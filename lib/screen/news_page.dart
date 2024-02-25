import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project4/model/model.dart';
import 'package:project4/screen/edit_page.dart';
import 'package:project4/screen/home_screen.dart';
import 'package:project4/widgets/text_widgets.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key, required this.blog});
  final Blog blog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff121212),
        leading:
            IconButton(onPressed: () {}, icon: Image.asset('assets/Back.png')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
              },
              icon: Image.asset('assets/Frame 30.png')),
          IconButton(
              onPressed: () {}, icon: Image.asset('assets/Frame 32.png')),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditPage(),
                    ));
              },
              icon: Image.asset('assets/Frame 33.png')),
        ],
      ),
      backgroundColor: Color(0xff121212),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: 400,
                height: 240,
                child: Image.network(
                  blog.img,
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/FrameP.png'),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'TECHNOLOGY',
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(
                              0xffBDA6F5,
                            )),
                      )
                    ],
                  ),
                  TextWidget(text: blog.title, size: 20),
                  SizedBox(
                    height: 10,
                  ),
                  Image.network(
                    blog.userImg,
                    height: 28,
                    width: 28,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    blog.author,
                    style: TextStyle(color: Color(0xffB8B8B8), fontSize: 14),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${blog.readingMinutes}• ${blog.date}',
                    style: TextStyle(color: Color(0xff888888), fontSize: 12),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Image.asset('assets/qqq.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset('assets/qq.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset('assets/q.png'),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextWidget(text: 'Summary', size: 16),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    blog.summary,
                    style: GoogleFonts.inter(color: Color(0xffB8B8B8)),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextWidget(text: 'Content', size: 16),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    blog.content,
                    style: GoogleFonts.inter(color: Color(0xffB8B8B8)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
