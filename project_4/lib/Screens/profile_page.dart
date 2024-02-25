import 'package:flutter/material.dart';
import 'package:games_app/widget/sitt.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1E1E1E),
      ),
      backgroundColor: const Color(0xFF1E1E1E),
      body: 
      ListView(
        children: const [
          SettingItem(
            icon: Icons.person_outline,
            title: 'Profile settings',
            subtitle: 'Settings regarding your profile',
          ),
          SettingItem(
            icon: Icons.newspaper_outlined,
            title: 'News settings',
            subtitle: 'Choose your favourite topics',
          ),
          SettingItem(
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            subtitle: 'When would you like to be notified',
          ),
          SettingItem(
            icon: Icons.folder_copy,
            title: 'Subscriptions',
            subtitle: 'Currently, you are in Starter Plan',
          ),
        ],
      ),
    );
  }
}