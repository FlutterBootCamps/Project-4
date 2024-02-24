import 'package:flutter/material.dart';
import 'package:project_4_alaa/helper/screen_helper.dart';
import 'package:project_4_alaa/widgets/contect_slider_widget.dart';

class SliderImageWidget extends StatelessWidget {
  const SliderImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PageController imageController = PageController(viewportFraction: 1);

    return SizedBox(
      width: context.getWidth() * 2,
      height: context.getWidth() * 0.5,
      child: PageView(
        controller: imageController,
        children: [
          ContentSlider(
            controller: imageController,
          ),
          ContentSlider(
            controller: imageController,
          ),
          ContentSlider(
            controller: imageController,
          ),
        ],
      ),
    );
  }
}
