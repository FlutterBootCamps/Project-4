import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_4/constant/color.dart';
import 'package:project_4/models/news_model.dart';

class EditPage extends StatefulWidget {
  EditPage({super.key, required this.news});
  final NewsModel news;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController titleController;
  late TextEditingController summaryController;
  late TextEditingController contentController;

  @override
  void initState() {
    // TODO: implement initState
    titleController = TextEditingController(text: widget.news.title);
    summaryController = TextEditingController(text: widget.news.summary);
    contentController = TextEditingController(text: widget.news.content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBlack,
      appBar: AppBar(
        backgroundColor: backgroundBlack,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: whiteColor,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                widget.news.title = titleController.text;
                widget.news.summary = summaryController.text;

                widget.news.content = contentController.text;
                Fluttertoast.showToast(
                    msg: "Changed Successfully",
                    backgroundColor: Colors.white,
                    toastLength: Toast.LENGTH_LONG,
                    textColor: Colors.black,
                    fontSize: 16.0);
                Navigator.pop(context);
              },
              child: Text(
                "Save",
                style: TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextFieldEdit(controller: titleController, title: "Title"),
            TextFieldEdit(controller: summaryController, title: "Summary"),
            TextFieldEdit(controller: contentController, title: "Content"),
          ]),
        ),
      ),
    );
  }
}

class TextFieldEdit extends StatelessWidget {
  const TextFieldEdit(
      {super.key, required this.controller, required this.title});

  final TextEditingController controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: TextStyle(
              color: whiteColor, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: backgroundAppBar,
          ),
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: controller,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                style: TextStyle(color: whiteColor),
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: whiteColor),
                    border: InputBorder.none),
              )),
        ),
      ],
    );
  }
}
