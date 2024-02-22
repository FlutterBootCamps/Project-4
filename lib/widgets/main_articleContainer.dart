import 'package:flutter/material.dart';
import 'package:news_app/helpers/extensions/screen_helper.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/fonts.dart';
import 'package:news_app/widgets/image_indicator.dart';

class MainArticleContainer extends StatelessWidget {
  const MainArticleContainer({
    super.key, required this.userName, required this.date, required this.headerText, required this.image,
  });
  final String userName;
  final String date;
  final String headerText;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(context),
      height: 180,
      padding: const EdgeInsets.only(top: 16,),
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image)),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const ImageIndicator(count: 3, activeIndex: 1,),
          Container(
            height: 50,
            padding: const EdgeInsets.only(left: 16),
            decoration: const BoxDecoration(gradient: LinearGradient(colors: [bgColor, mainArticleShadeColor1, mainArticleShadeColor2, noColor], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$userName • $date", style: const TextStyle(color: lilGreyColor, fontFamily: mainFont, fontSize: 10, fontWeight: FontWeight.w500),),
                    Text(headerText, style: const TextStyle(color: whiteColor, fontFamily: mainFont, fontSize: 16, fontWeight: FontWeight.bold),)
                  ],
                ),
                IconButton(onPressed: (){}, icon: Image.asset("assets/icons/arrow_topright.png", ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
