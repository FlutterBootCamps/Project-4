import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  // IconData for the item's icon
  final IconData icon;
  // Title of the setting item
  final String title;
  // Subtitle of the setting item
  final String subtitle;

  // Constructor for SettingItem
  const SettingItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // Leading widget containing the item's icon
      leading: Container(
        height: 60,
        width: 60,
        color: Colors.white,
        child: Icon(icon, color: Colors.black),
      ),
      // Title text
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      // Subtitle text
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey),
      ),
      // Trailing icon for navigation
      trailing: Icon(Icons.chevron_right, color: Colors.white),
      // Function to execute when the item is tapped
      onTap: () {
        // TODO: Insert your onTap function here
      },
    );
  }
}
