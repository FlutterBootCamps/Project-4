import 'package:flutter/material.dart';
import 'package:project_4_saad_alharbi/extensions/screen_handler.dart';
import 'package:project_4_saad_alharbi/model/blog_model.dart';
import 'package:project_4_saad_alharbi/screen/blog_details.dart';

class StoriesContainer extends StatelessWidget {
  const StoriesContainer(
      {super.key,
      this.blogs,
      this.isSaved = false,
      this.onPressed,
      required this.index});
  final BlogModel? blogs;
  final bool? isSaved;
  final Function()? onPressed;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushTo(
          view: BlogDetails(
        blogs: blogs,
        index: index,
      )),
      child: Container(
        height: 108,
        margin: const EdgeInsets.only(bottom: 20),
        width: context.getWidth(),
        decoration: const BoxDecoration(
          color: Color(0xff1E1E1E),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    height: 70,
                    width: 90,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Image.network(
                      blogs?.img ??
                          "https://www.pluralsight.com/content/dam/ps/images/resource-center/blog/header-hero-images/ChatGPT-vs-Bard-c.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          blogs?.author ?? "Jeremy Morgan",
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.8)),
                        ),
                        Text(
                          blogs?.title ??
                              "ChatGPT Vs Bard: Which is better for coding?",
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${blogs?.date} • 2 min read",
                      style: TextStyle(color: Colors.white.withOpacity(0.7)),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: onPressed,
                              icon: Icon(
                                isSaved!
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                                weight: 18,
                                color: isSaved! ? Colors.white : Colors.grey,
                              )),
                          const Icon(
                            Icons.more_vert,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
