import 'package:flutter/material.dart';
import 'package:project4/widgets/account_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111111),
      appBar: AppBar(
        backgroundColor: Color(0xff111111),
        title: Text(
          'Account',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body:ListView(
        children: [
           AccountCard(AccImages: 'assets/images/acc_img1.png',),
           AccountCard(AccImages: 'assets/images/acc_img2.png',),
           AccountCard(AccImages: 'assets/images/acc_img3.png',),
           AccountCard(AccImages: 'assets/images/acc_img4.png',),
         
       
        ],
      )
    );
  }
}

