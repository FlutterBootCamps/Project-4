import 'package:flutter/material.dart';
import 'package:project_4/constant/color.dart';

class ProfileCard extends StatelessWidget {
  ProfileCard(
      {super.key,
      required this.imge,
      required this.title,
      required this.description});

  String imge;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundBlack,
      child: Column(
        children: [
          Row(children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.20,
                height: MediaQuery.of(context).size.height * 0.09,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  imge,
                )),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: whiteColor, fontSize: 16),
                ),
                Text(description,
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 14,
                    )),
              ],
            ),
            Spacer(),
            Icon(
              Icons.arrow_circle_right_outlined,
              color: whiteColor,
            )
          ]),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
