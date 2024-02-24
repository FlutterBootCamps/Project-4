import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_4_saad_alharbi/model/blog_model.dart';

class DetailedBlog extends StatelessWidget {
  const DetailedBlog({super.key, this.blogs});

  final BlogModel? blogs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset("assets/icons/Frame.svg"),
            Text(
              "  ${blogs?.field.toUpperCase()}",
              style: const TextStyle(
                  color: Color(0xffBDA6F5),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ],
        ),
        Text(
          blogs?.title ?? "ChatGPT Vs Bard: Which is better for coding?",
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28),
        ),
        const SizedBox(
          height: 10,
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(blogs?.userImg ??
              "https://media.licdn.com/dms/image/C5603AQGWv1lninOnsg/profile-displayphoto-shrink_800_800/0/1563427546912?e=2147483647&v=beta&t=PW_RxDtuLtsClc6-VQDRGc8pXBrm950k32J1K2LNfsQ"),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          blogs?.author ?? "Jeremy Morgan",
          style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "2 min read • ${blogs?.date}",
          style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SvgPicture.asset("assets/icons/facebook.svg"),
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset("assets/icons/x.svg"),
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset("assets/icons/attached.svg"),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          "Summary",
          style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          blogs?.summary ??
              "For programmers, Generative AI offers tangible benefits. It helps with writing and debugging code, making our busy lives a bit easier as a result. But there are now competing tools like ChatGPT and Bard, which begs the question: which one is best for me to use?",
          style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Content",
          style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          blogs?.content ??
              "The biggest difference between ChatGPT and Bard is the Large Language Models (LLMs) they are powered by. ChatGPT uses the Generative Pre-trained Transformer 4 (GPT-4), while Bard uses the Language Model for Dialogue Applications (LaMBDA). Also, ChatGPT is developed by OpenAI, while Bard was built by Google. Both models were trained on a massive dataset, including Common Crawl, Wikipedia, books, articles, documents, and content scraped from the internet. However, Bard is a little different in that it was trained on conversations and dialogues from the web, while ChatGPT was trained mostly on scraped general content. Both products are still under development, Bard a bit more so than ChatGPT. But to really show how these differences actually matter in a practical sense, here’s how they work when tested against each other. At a score of four to three, ChatGPT wins overall (👑), but in practice both of these tools should be a part of your arsenal.",
          style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16),
          overflow: TextOverflow.fade,
        ),
      ],
    );
  }
}
