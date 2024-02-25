import 'package:flutter/material.dart';
import 'package:project4/model/information.dart';

class EditScreen extends StatefulWidget {
  final Information information;

  const EditScreen({required this.information});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController titleController;
  late TextEditingController summaryController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.information.title);
    summaryController = TextEditingController(text: widget.information.summary);
    contentController = TextEditingController(text: widget.information.content);
  }

  @override
  void dispose() {
    titleController.dispose();
    summaryController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111111),
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon:Icon(Icons.arrow_back_ios,color: Colors.white,) ),
        backgroundColor: Color(0xff111111),
        actions: [
          InkWell(
            onTap: () {
              // Save changes and pop the screen
              Information updatedInfo = Information(
                title: titleController.text,
                summary: summaryController.text,
                content: contentController.text,
                author: widget.information.author,
                readingMinutes: widget.information.readingMinutes,
                date: widget.information.date,
              );
              Navigator.pop(context, updatedInfo);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff2E2E2E),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: titleController,
                style: TextStyle(color: Color(0xffDCD5D5)),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                maxLines: 2,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Summary',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff2E2E2E),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: summaryController,
                style: TextStyle(color: Color(0xffDCD5D5)),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                maxLines: 3,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Content',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff2E2E2E),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: contentController,
                style: TextStyle(color: Color(0xffDCD5D5)),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                maxLines: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
