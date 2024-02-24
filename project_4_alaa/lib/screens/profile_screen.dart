import 'package:flutter/material.dart';
import 'package:project_4_alaa/constant/color.dart';
import 'package:project_4_alaa/widgets/setting_card_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Account", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: white), ),
              // height12,
              SettingCard(title: "Profile settings", 
              subtitle: "Settings regarding your profile", 
              image: "asset/images/person-outline.png", ),
              SettingCard(title: "News settings", 
              subtitle: "Choose your favourite topics", 
              image: "asset/images/Combined Shape.png", ),
              SettingCard(title: "Notifications", 
              subtitle: "When would you like to be notified", 
              image: "asset/images/notifications-outline.png", ),
              SettingCard(title: "Subscriptions", 
              subtitle: "Currently, you are in Starter Plan", 
              image: "asset/images/folder-open-outline.png", ),
            
              
            ],
          ),
        ),
      ),
      
    );
  }
}
