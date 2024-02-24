import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4_saad_alharbi/bloc/blog_bloc.dart';
import 'package:project_4_saad_alharbi/extensions/screen_handler.dart';
import 'package:project_4_saad_alharbi/widgets/stories_container.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlogBloc>(context);
    String input;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white.withOpacity(0.2),
                  alignLabelWithHint: true,
                  contentPadding: const EdgeInsets.all(8),
                  hoverColor: Colors.white.withOpacity(0.2),
                  filled: true,
                  focusColor: Colors.white,
                  hintText: 'Search for News',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIconColor: Colors.white.withOpacity(0.5),
                  prefixIcon: const Icon(Icons.search),
                  border: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.white), 
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  bloc.add(SearchEvent(value));
                },
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: context.getWidth(),
                height: context.getHeight() / 1.3,
                child: BlocBuilder<BlogBloc, BlogState>(
                  builder: (context, state) {
                    if (state is SuccessState) {
                      input = state.input?.toLowerCase() ?? '';
                      if (input == "") {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.white.withOpacity(0.5),
                              size: 50,
                            ),
                            Text(
                              "Search for a news",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 30),
                            )
                          ],
                        );
                      }
                      return ListView.builder(
                        itemCount: state.blogs.length,
                        itemBuilder: (context, index) {
                          if (state.blogs[index].title
                              .toLowerCase()
                              .contains(input)) {
                            return StoriesContainer(
                              blogs: state.blogs[index],
                              isSaved: state.savedList.contains(index),
                              onPressed: () {
                                bloc.add(SavedEvent(index: index));
                              },
                              index: index,
                            );
                          } else {
                            return Container();
                          }
                        },
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
            ],
          ),
        ),
      )),
    );
  }
}
