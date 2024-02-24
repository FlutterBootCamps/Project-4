import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4_saad_alharbi/bloc/blog_bloc.dart';

import '../widgets/edit_text_felid.dart';

class EditBlog extends StatelessWidget {
  const EditBlog({super.key, required this.index});
   final int index;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlogBloc>(context);
    TextEditingController titleController = TextEditingController();
    TextEditingController summaryController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () {
                bloc.add(EditEvent(
                    index: index,
                    title: titleController.text,
                    content: contentController.text,
                    summary: summaryController.text));
              },
              child: const Text(
                "Save",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: BlocBuilder<BlogBloc, BlogState>(
            builder: (context, state) {
              if (state is SuccessState) {
                titleController.text = state.blogs[index].title;
                summaryController.text = state.blogs[index].summary;
                contentController.text = state.blogs[index].content;
                return Column(
                  children: [
                    EditTextFelid(
                      title: 'Title',
                      controller: titleController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    EditTextFelid(
                      title: 'Summary',
                      controller: summaryController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    EditTextFelid(
                      title: 'Content',
                      controller: contentController,
                    )
                  ],
                );
              }
              return const Text(
                "Error",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              );
            },
          ),
        ),
      )),
    );
  }
}
