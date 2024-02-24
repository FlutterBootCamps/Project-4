import 'package:flutter/material.dart';
import 'package:project_4_alaa/constant/color.dart';
import 'package:project_4_alaa/constant/space.dart';
import 'package:project_4_alaa/helper/screen_helper.dart';
import 'package:project_4_alaa/model/news_model.dart';
import 'package:project_4_alaa/screens/bottom_nav_bar.dart';
import 'package:project_4_alaa/screens/edit_news_screen.dart';

class DetailNews extends StatelessWidget {
  const DetailNews({super.key, required this.singleNews});
  final NewsModel singleNews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(          
            onPressed: (){
            context.pushTo(view:const BottomNavBar());
          }, 
          icon: const Icon(Icons.arrow_back_ios, color: white,),
          ),
        ),
        actions: [
         Image.asset("asset/images/FrameFont.png"),
          const Icon(
            Icons.bookmark_border_rounded,
            color: white,
          ),
          IconButton(            
              icon: const Icon(Icons.edit_outlined, color: white),
              onPressed: () {
                context.pushTo(view: EditNewsScreen(updateNews: singleNews,));
              }),
    
          
        ],
      ),


      body: SafeArea(
          child: SizedBox(
             height: context.getHeight(),
                    width: context.getWidth(),
            child: ListView(
                    children: [
            Column(
              children: [
                Image.network(
                  singleNews.img,
                  fit: BoxFit.fill,
                  // "asset/images/image.png",
                  // height: context.getWidth() * 0.709,
                  width: context.getWidth(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "asset/images/frame.png",
                          ),
                          width8,
                          Text(
                            singleNews.field,
                            // "Technology",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: purple),
                          )
                        ],
                      ),
                        
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              singleNews.title,
                              overflow: TextOverflow.visible,
                              style: const TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      height12,
                        
                      ///////
                      ClipOval(
                        child: Image.network(
                          singleNews.userImg,
                          fit: BoxFit.cover,
                          width: context.getWidth() * 0.09,
                        ),
                      ),
                      height8,
                      Text(
                        singleNews.author,
                        style: const TextStyle(
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      height12,
                      Text(
                        "${singleNews.readingMinutes} min reed • ${singleNews.date}",
                        style: const  TextStyle(
                            color: grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      height8,
                        
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("asset/images/facebook_icon.png"),
                          width12,
                          Image.asset("asset/images/twitter_icon.png"),
                          width12,
                          Image.asset("asset/images/link_icon.png"),
                        ],
                      ),
                        
                      height32,
                        
                      const Align(
                        alignment: Alignment.centerLeft,
                        child:  Text(
                          "Summary",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: white),
                        ),
                      ),
                      height16,
                      Text(
                        singleNews.summary,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: grey),
                      ),
                        
                      height32,
                        
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Content",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: white),
                          )),
                      height16,
                      Text(
                        singleNews.content,                        
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: grey),
                      ),
                      height48,
                    ],
                  ),
                ),
              ],
            ),
                    ],
                  ),
          )),
    );
  }
}
