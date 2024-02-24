import 'package:flutter/material.dart';

class EditTextFelid extends StatelessWidget {
  const EditTextFelid({
    super.key,
    required this.title,
    required this.controller,
  });
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: controller,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
            fillColor: Colors.white.withOpacity(0.2),
            contentPadding: const EdgeInsets.all(20),
            hoverColor: Colors.white.withOpacity(0.2),
            filled: true,
            focusColor: Colors.white,
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
