import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/component/news_row_card.dart';
import 'package:news_app/page/const_color.dart';

class accountCard extends StatelessWidget {
  const accountCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });
  final IconData icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              width: 56,
              height: 56,
              child: Icon(
                icon,
                color: Colors.black,
                size: 20,
              )),
          SizedBox(
            width: 20,
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    news: title,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                CustomText(
                    news: subTitle,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400)
              ],
            ),
          ),
          Icon(
            Icons.arrow_circle_right_outlined,
            color: iconColor,
          )
        ],
      ),
    );
  }
}
