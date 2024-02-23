import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// This is the indicator that shows on top of the mainArticleContainer.
class ImageIndicator extends StatelessWidget {
  const ImageIndicator({
    super.key,
    required this.count,
    required this.activeIndex,
  });
  final int count;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 12,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: dotContainerColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: count,
        effect: const WormEffect(
          activeDotColor: whiteColor,
          dotColor: dotInactiveColor,
          dotWidth: 4,
          dotHeight: 4,
          spacing: 4,
        ),
      ),
    );
  }
}
