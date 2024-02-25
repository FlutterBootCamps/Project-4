import 'package:flutter/material.dart';
import 'package:project4/widgets/text_widgets.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextWidget(text: 'Account', size: 20),
          ),
          ListTile(
            leading: Image.asset('assets/Icon.png'),
            title: TextWidget(text: 'Profile settings', size: 14),
            subtitle:
                TextWidget(text: 'Settings regarding your profile', size: 12),
            trailing: IconButton(
                onPressed: () {},
                icon: Image.asset('assets/arrow-forward-circle-outline.png')),
          ),
          ListTile(
            leading: Image.asset('assets/Icon (1).png'),
            title: TextWidget(text: 'News settings', size: 14),
            subtitle:
                TextWidget(text: 'choose your favourite topics', size: 12),
            trailing: IconButton(
                onPressed: () {},
                icon: Image.asset('assets/arrow-forward-circle-outline.png')),
          ),
          ListTile(
            leading: Image.asset('assets/Icon (2).png'),
            title: TextWidget(text: 'Notifications', size: 14),
            subtitle: TextWidget(
                text: 'When would you like ro be notified', size: 12),
            trailing: IconButton(
                onPressed: () {},
                icon: Image.asset('assets/arrow-forward-circle-outline.png')),
          ),
          ListTile(
            leading: Image.asset('assets/Icon (3).png'),
            title: TextWidget(text: 'Subscriptions', size: 14),
            subtitle:
                TextWidget(text: 'Currently,you are in Starter Plan', size: 12),
            trailing: IconButton(
                onPressed: () {},
                icon: Image.asset('assets/arrow-forward-circle-outline.png')),
          ),
        ],
      ),
    );
  }
}
