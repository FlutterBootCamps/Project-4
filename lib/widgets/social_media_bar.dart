import 'package:flutter/material.dart';

// This is a verstile bar that can be used to display multiple icons that can be clicked.
class SocialMediaBar extends StatelessWidget {
  const SocialMediaBar({
    super.key,
    required this.icons,
  });
  final List<String> icons;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(icons.length, (index) {
          return Row(
            children: [
              InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(icons[index])),
              const SizedBox(
                width: 12,
              ),
            ],
          );
        }));
  }
}
