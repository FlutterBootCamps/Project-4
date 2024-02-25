
import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({
    super.key, required this.AccImages,
  });
final String AccImages;
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 56,
        width: 311,
        child: Row(
          children: [
            SizedBox(
                height: 56,
                width: 56,
                child: Image.asset(AccImages)),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: SizedBox(
                height: 39,
                width: 152,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profile settings',
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Settings regarding y',
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 130,),
            SizedBox(
              child: Icon(
                Icons.arrow_circle_right_outlined,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}