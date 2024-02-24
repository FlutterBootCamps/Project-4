import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4_alaa/bloc/news_bloc.dart';
import 'package:project_4_alaa/constant/color.dart';

class SearchTextFieldWidget extends StatelessWidget {
  SearchTextFieldWidget({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      // onChanged: BlocProvider.of<NewsBloc>(context).add(SearchNewsEvent(title: searchController.text)),

      controller: searchController,
      decoration: InputDecoration(
        filled: true,
        fillColor: darkGrey1,
        prefixIcon: InkWell(
            onTap: () {
              BlocProvider.of<NewsBloc>(context)
                  .add(SearchNewsEvent(title: searchController.text));
            },
            child: const Icon(
              Icons.search,
              color: white,
            )),
        hintText: "Search for News",
        hintStyle: const TextStyle(
            color: greyforText, fontSize: 14, fontWeight: FontWeight.bold),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2.0),
        ),
      ),
      style: const TextStyle(
          fontFamily: 'Inter',
          color: white,
          fontSize: 14,
          fontWeight: FontWeight.w500),
    );
  }
}
