import 'package:flutter/material.dart';
import 'package:project_4_alaa/constant/color.dart';
import 'package:project_4_alaa/constant/space.dart';
import 'package:project_4_alaa/helper/screen_helper.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({super.key, required this.title, required this.subtitle, required this.image});
  final String title;
  final String subtitle;
  final String image;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32, top: 24, ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: context.getWidth() * 0.12,
                    width: context.getWidth() * 0.12,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: white,
                      ),
                      child: Image.asset(image),
                    ),
                  ),
                ],
              ),
              width12,
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: white, fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  height5,
                  Text(
                    subtitle,
                    style: const TextStyle(
                        color: white, fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
          Image.asset(
            "asset/images/arrow_icon.png",
          ),
          // width8,
        ],
      ),
    );
  }
}
