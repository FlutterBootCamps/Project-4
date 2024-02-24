import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4_saad_alharbi/bloc/blog_bloc.dart';
import 'package:project_4_saad_alharbi/extensions/screen_handler.dart';
import 'package:project_4_saad_alharbi/model/blog_model.dart';
import 'package:project_4_saad_alharbi/screen/edit_blog.dart';

import '../widgets/detailed_blog.dart';

class BlogDetails extends StatelessWidget {
  const BlogDetails({super.key, this.blogs, required this.index});
  final BlogModel? blogs;
  final int index;
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlogBloc>(context);

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
          const Text(
            "Aa",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          BlocBuilder<BlogBloc, BlogState>(
            builder: (context, state) {
              if (state is SuccessState) {
                return IconButton(
                    onPressed: () {
                      bloc.add(SavedEvent(index: index));
                    },
                    icon: Icon(
                      state.savedList.contains(index)
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      weight: 18,
                      color: state.savedList.contains(index)
                          ? Colors.white
                          : Colors.grey,
                    ));
              }
              return Container();
            },
          ),
          IconButton(
              onPressed: () {
                context.pushTo(
                    view: EditBlog(
                  index: index,
                ));
              },
              icon: const Icon(
                Icons.edit_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: context.getWidth(),
                height: context.getWidth() / 2,
                color: Colors.black,
                child: Image.network(
                  blogs?.img ??
                      "https://www.pluralsight.com/content/dam/ps/images/resource-center/blog/header-hero-images/ChatGPT-vs-Bard-c.png",
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: BlocBuilder<BlogBloc, BlogState>(
                    builder: (context, state) {
                      if (state is SuccessState) {
                        return DetailedBlog(
                          blogs: blogs,
                        );
                      }
                      return const Text(
                        "Error",
                        style: TextStyle(color: Colors.white),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
