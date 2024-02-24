import 'package:flutter/material.dart';
import 'package:project_4_alaa/constant/color.dart';
import 'package:project_4_alaa/helper/screen_helper.dart';

class SliderImageWidget extends StatelessWidget {
  const SliderImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth() * 0.9,
      height: context.getWidth() * 0.5,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Stack(
          children: [
            Image.asset(
              "asset/images/drone.png",
              width: context.getWidth() * 0.9,
              height: context.getWidth() * 0.5,
            ),
            const Positioned(
              left: 16,
              bottom: 45,
              child: Text("jul 10. 2023 * 4 min read",
                  style: TextStyle(fontSize: 12, color: grey)),
            ),
            const Positioned(
              bottom: 22,
              left: 16,
              child: Text(
                "A month with DJI Min 3 Pro",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600, color: white),
              ),
            ),
            const Positioned(
              right: 10,
              bottom: 25,
              child: Icon(Icons.arrow_outward_rounded, color: white),
            ),
         
            // Positioned(
            //   bottom: 50,
            //   right: 20,
            //   child: Container(
            //     width: context.getWidth() * 0.7,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(50),
            //       color: red,
            //     ),
            //   ),
            // ),
          
          ],
        ),
      ),
    );
  }
}
