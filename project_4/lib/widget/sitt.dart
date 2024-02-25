import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const SettingItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 60,
        width: 60,
        color: Colors.white,
        child: Icon(icon, color: Colors.black)),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.white),
      onTap: () {
        
      },
    );
  }
}