import 'package:flutter/material.dart';
import 'package:project_4_saad_alharbi/extensions/screen_handler.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer(
      {super.key,
      required this.decoration,
      required this.icons,
      required this.title});
  final String title;
  final String decoration;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      width: context.getWidth(),
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Icon(
              icons,
              color: Colors.black,
              size: 30,
            ),
          ),
          SizedBox(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(decoration,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ))
                ],
              ),
            ),
          ),
          const Icon(
            Icons.arrow_circle_right_outlined,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
