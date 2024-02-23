import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/fonts.dart';
import 'package:news_app/widgets/go_to_card.dart';

// This is the profile page, where the user can modify their settings as well as access their info, it can be accessed through the NavigationPage.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bgColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 23, right: 17),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 28,
              ),
              const Text(
                "Account",
                style: TextStyle(
                    color: whiteColor,
                    fontFamily: mainFont,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 28,
              ),
              GoToCard(
                icon: "asstes/icons/person_black.png",
                topText: "Profile Settings",
                bottomText: "Settings regarding your profile",
                onTap: () {},
              ),
              const SizedBox(
                height: 24,
              ),
              GoToCard(
                icon: "asstes/icons/newspaper_black.png",
                topText: "News Settings",
                bottomText: "Choose your favourite topics",
                onTap: () {},
              ),
              const SizedBox(
                height: 24,
              ),
              GoToCard(
                icon: "asstes/icons/bell_black.png",
                topText: "Notifications",
                bottomText: "When would you like to be notfied",
                onTap: () {},
              ),
              const SizedBox(
                height: 24,
              ),
              GoToCard(
                icon: "asstes/icons/folder_black.png",
                topText: "Subscriptions",
                bottomText: "Currntly you are in Starter Plan",
                onTap: () {},
              ),
            ]),
          ),
        ));
  }
}
