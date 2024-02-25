import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_4/pages/profile_page/profile_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 18, 18),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Account",
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const ProfileCard(
              image: "assets/person-outline.png",
              title: "Profile settings",
              supTitle: "Settings regarding your profile",
            ),
            const SizedBox(
              height: 20,
            ),
            const ProfileCard(
              image: "assets/newspaper-outline.png",
              title: "News settings",
              supTitle: "Choose your favorite topics",
            ),
            const SizedBox(
              height: 20,
            ),
            const ProfileCard(
              image: "assets/notifications-outline.png",
              title: "Notifications",
              supTitle: "When would you like to be notified",
            ),
            const SizedBox(
              height: 20,
            ),
            const ProfileCard(
              image: "assets/folder-open-outline.png",
              title: "Subscriptions",
              supTitle: "Currently, you are in Starter Plan",
            ),
          ],
        ),
      ),
    );
  }
}
