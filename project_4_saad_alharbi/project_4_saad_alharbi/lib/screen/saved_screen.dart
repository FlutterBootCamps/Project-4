import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4_saad_alharbi/bloc/blog_bloc.dart';
import 'package:project_4_saad_alharbi/extensions/screen_handler.dart';
import 'package:project_4_saad_alharbi/model/blog_model.dart';
import 'package:project_4_saad_alharbi/widgets/stories_container.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlogBloc>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Saved News",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: context.getWidth(),
          height: context.getHeight(),
          child: BlocBuilder<BlogBloc, BlogState>(
            builder: (context, state) {
              if (state is LoadingState || state is BlogInitial) {
                return const SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
              if (state is SuccessState) {
                if (state.savedList.isNotEmpty) {
                  return ListView.builder(
                    itemCount: state.savedList.length,
                    itemBuilder: (context, index) {
                      BlogModel savedBlog = state.blogs[state.savedList[index]];
                      return StoriesContainer(
                        blogs: savedBlog,
                        index: index,
                        isSaved: state.savedList
                            .contains(state.blogs.indexOf(savedBlog)),
                        onPressed: () {
                          bloc.add(SavedEvent(
                              index: state.blogs.indexOf(savedBlog)));
                        },
                      );
                    },
                  );
                }
              }
              return Center(
                child: Text(
                  "No news found",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 30,
                  ),
                ),
              );
            },
          ),
        ),
      )),
    );
  }
}
