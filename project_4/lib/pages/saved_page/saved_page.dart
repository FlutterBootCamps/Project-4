import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_4/bloc/articles_bloc.dart';
import 'package:project_4/helper/extintion.dart';
import 'package:project_4/pages/saved_page/widgets/saved_cards.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ArticlesBloc>().add(LaudingSavesDataEvent());
    final bloc = BlocProvider.of<ArticlesBloc>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 18, 18),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Saved News",
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<ArticlesBloc, ArticlesState>(
              builder: (context, state) {
                if (state is LoudeningSavedState) {
                  if (bloc.save.isNotEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }
                } else if (state is FinishLoudeningSavedState) {
                  if (bloc.save.isEmpty) {
                    return Column(
                      children: [
                        SizedBox(height: context.getHeight()/3),
                        Center(
                          child: Text(
                            "No news found",
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 184, 184, 184)),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        ...bloc.save.map((e) {
                          return SavedArticlesCard(
                            article: e,
                          );
                        })
                      ],
                    );
                  }
                }
                return Center(
                  child: Text(
                    "No news found",
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 184, 184, 184)),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
