import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4_alaa/bloc/news_bloc.dart';
import 'package:project_4_alaa/constant/color.dart';
import 'package:project_4_alaa/constant/space.dart';
import 'package:project_4_alaa/helper/screen_helper.dart';
import 'package:project_4_alaa/model/news_model.dart';
import 'package:project_4_alaa/screens/detail_news_screen.dart';


class EditNewsScreen extends StatelessWidget {
  EditNewsScreen({super.key, required this.updateNews});
  final NewsModel updateNews;
  TextEditingController titleController = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  TextEditingController contentController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            onPressed: () {
              context.pushTo(view: DetailNews(singleNews: updateNews, ));
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: white,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:  InkWell(
              onTap: (){
                BlocProvider.of<NewsBloc>(context).add(UpdateNewsEvent(
                  id: updateNews.userID,
                  newTitle:titleController.text,
                  newSummary: summaryController.text,
                  newContent: contentController.text,
                ));
                
                context.pushTo(view: DetailNews(singleNews:  updateNews,));
          
              },
              child:const Text(
                "Save",
                style: TextStyle(
                    color: white, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const  EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Title",
                    style: TextStyle(
                        color: white, fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  height8,
                   TextField(       
                    minLines: 1,
                    maxLines: 2,           
                      controller: titleController,
                      decoration:  InputDecoration(
                        filled: true,
                        fillColor: darkGrey1,
                        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal:  12),                        
                        hintText: updateNews.title, 
                        //"Now Google’s Bard AI Chatbot can talk & respond to visual prompts!",
                        hintStyle: const TextStyle(color: greyforText, fontSize: 16, fontWeight: FontWeight.bold),
                        enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10),),),
                        focusedBorder: const OutlineInputBorder(
                        borderSide:  BorderSide(width: 2.0),
                      ),
                      ),
                      style: const  TextStyle(fontFamily: 'Inter', color: white , fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                   
                    height24,
              
                  const Text(
                    "Summary",
                    style: TextStyle(
                        color: white, fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  height8,
                  TextField(       
                    minLines: 1,
                    maxLines: 3,           
                      controller: summaryController,
                      decoration:  InputDecoration(
                        filled: true,
                        fillColor: darkGrey1,
                        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal:  12),                        
                        hintText: updateNews.summary, 
                        // "Now Google’s Bard AI Chatbot can talk & respond to visual prompts!",
                        hintStyle: const TextStyle(color: greyforText, fontSize: 16, fontWeight: FontWeight.bold),
                        enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10),),),
                        focusedBorder: const OutlineInputBorder(
                        borderSide:  BorderSide(width: 2.0),
                      ),
                      ),
                      style: const TextStyle(fontFamily: 'Inter', color: white , fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                   

                  height24,
                  const Text(
                    "Content",
                    style: TextStyle(
                        color: white, fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  height8,
                  TextField(       
                    minLines: 1,
                    maxLines: 10,           
                      controller: contentController,
                      decoration:  InputDecoration(
                        filled: true,
                        fillColor: darkGrey1,
                        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal:  12),                        
                        hintText: updateNews.content,
                        //  "Now Google’s Bard Arespond to visual prompts!Now Google’s Bard AI Chatbot can talk & respond to visual prompts!Now Google’s Bard AI Chatbot can talk & respond to visual prompts!Now Google’s Bard AI Chatbot can talk & respond to visual prompts!Now Google’s Bard AI Chatbot can talk & respond to visual prompts!Now Google’s Bard AI Chatbot can talk & respond to visual prompts!Now Google’s Bard AI Chatbot can talk & respond to visual prompts!",
                        hintStyle: const TextStyle(color: greyforText, fontSize: 16, fontWeight: FontWeight.bold),
                        enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10),),),
                        focusedBorder: const OutlineInputBorder(
                        borderSide:  BorderSide(width: 2.0),
                      ),
                      ),
                      style: const TextStyle(fontFamily: 'Inter', color: white , fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                   
              
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
