import 'package:flutter/material.dart';
import 'package:project_4/constant/color.dart';
import 'package:project_4/widgets/profile_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBlack,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Accout",
              style: TextStyle(
                  fontSize: 20, color: whiteColor, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Column(
                children: [
                  ProfileCard(
                    imge: 'assets/images/person-outline.png',
                    title: "Profile setting",
                    description: "setting regarding your profile",
                  ),
                  ProfileCard(
                    imge: 'assets/images/news.png',
                    title: "News setting",
                    description: "choose your favorite topics",
                  ),
                  ProfileCard(
                    imge: 'assets/images/notifications-outline.png',
                    title: "Notifaications",
                    description: "when would you like to be",
                  ),
                  ProfileCard(
                    imge: 'assets/images/folder-open-outline.png',
                    title: "Subscriptions",
                    description: "currently, you are Starter Plan",
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
