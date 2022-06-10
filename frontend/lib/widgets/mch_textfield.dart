import 'package:flutter/material.dart';

class MCHTextField extends StatelessWidget {
  String? hint;
  MCHTextField({Key? key, this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 10),
        filled: true,
        fillColor: Color(0xFFEAF1FD),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(9)
        ),
        hintText: hint
      )
    );
  }
}