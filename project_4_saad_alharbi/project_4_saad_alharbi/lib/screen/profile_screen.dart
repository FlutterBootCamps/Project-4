import 'package:flutter/material.dart';
import 'package:project_4_saad_alharbi/widgets/profile_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Account",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            ProfileContainer(
              title: 'Profile settings',
              decoration: 'Settings regarding your profile',
              icons: Icons.person_outline,
            ),
            ProfileContainer(
              title: 'News settings',
              decoration: 'Choose your favorite topics',
              icons: Icons.feed_outlined,
            ),
            ProfileContainer(
              title: 'Notifications',
              decoration: 'When would you like to be notified',
              icons: Icons.notifications_none_sharp,
            ),
            ProfileContainer(
              title: 'Subscriptions',
              decoration: 'Currently, you are in Starter Plan',
              icons: Icons.folder_open,
            ),
          ],
        ),
      )),
    );
  }
}
