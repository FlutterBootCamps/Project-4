import 'package:flutter/material.dart';
import 'package:news_app/component/profile_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
          title: const Text('Account',
              style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            accountCard(
              icon: Icons.person_outline_rounded,
              title: 'Profile settings',
              subTitle: 'Settings regarding your profile',
            ),
            accountCard(
              icon: Icons.newspaper,
              title: 'News settings',
              subTitle: 'Choose your favorite topics',
            ),
            accountCard(
              icon: Icons.notifications_none,
              title: 'Notifications',
              subTitle: 'When would you like to be notified',
            ),
            accountCard(
              icon: Icons.folder,
              title: 'Subscriptions',
              subTitle: 'Currently,you are in Starter Plan',
            ),
          ],
        ));
  }
}
