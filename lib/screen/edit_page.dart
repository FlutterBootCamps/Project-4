import 'package:flutter/material.dart';

import 'package:project4/widgets/container_grey_box.dart';
import 'package:project4/widgets/text_widgets.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff121212),
        leading:
            IconButton(onPressed: () {}, icon: Image.asset('assets/Back.png')),
        actions: [
          IconButton(onPressed: () {}, icon: TextWidget(text: 'Save', size: 17))
        ],
      ),
      backgroundColor: Color(0xff121212),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 20,
            ),
            TextWidget(text: 'Title', size: 17),
            SizedBox(
              height: 10,
            ),
            ContainerGreyBox(
              text:
                  'Now Google’s Bard AI Chatbot can talk &    respond to visual prompts!',
              color: Color(0xffFFFFFF),
            ),
            SizedBox(
              height: 30,
            ),
            TextWidget(text: 'Summary', size: 17),
            SizedBox(
              height: 10,
            ),
            ContainerGreyBox(
              text:
                  'Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to .....',
              color: Color(0xffFFFFFF),
            ),
            SizedBox(
              height: 30,
            ),
            TextWidget(text: 'Content', size: 17),
            SizedBox(
              height: 10,
            ),
            ContainerGreyBox(
              text:
                  'The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.”Google is introducing a few other new features, too, including the ability to pin and rename conversations, share responses with your friends, and change the tone and style of the responses you get back from Bard.Google first opened up access to Bard in March, but at the time, it was available only in the US and the UK. The company has been rolling out the chatbot to many more countries since then, and that now includes “all countries in the EEA [European Economic Area] and Brazil,” Google spokesperson Jennifer Rodstrom tells The Verge. That expansion in Europe is a notable milestone; the company’s planned Bard launch in the EU was delayed due to privacy concerns.',
              color: Color(0xffB8B8B8),
            ),
          ]),
        ),
      ),
    );
  }
}
