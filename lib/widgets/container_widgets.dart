import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project4/model/model.dart';
import 'package:project4/screen/news_page.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.blog,
  });
  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsPage(
                blog: blog,
              ),
            ));
      },
      child: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(
          8,
        ),
        height: 108,
        width: 343,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xff1E1E1E),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 62,
                  width: 80,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: Image.network(blog.img, fit: BoxFit.fill),
                ),
                SizedBox(width: 15), // Added SizedBox for spacing
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        blog.author,
                        style:
                            TextStyle(color: Color(0xffB8B8B8), fontSize: 12),
                      ),
                      Text(
                        blog.title,
                        style: GoogleFonts.inter(
                          color: Color(0xffE8E8E8),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Text(
                    '${blog.date}• ${blog.readingMinutes}',
                    style: TextStyle(color: Color(0xff888888), fontSize: 10),
                  ),
                  SizedBox(width: 130),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                          'assets/Vectojr.png')), //SizedBox(width: 1,)
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/Vector (1).png')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
