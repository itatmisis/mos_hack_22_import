import 'package:flutter/material.dart';

class MCHTextField extends StatelessWidget {
  String? hint;
  double? width, height;

  MCHTextField({Key? key, this.hint, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.width,
      height: this.height,
      child: TextField(
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
      ),
    );
  }
}