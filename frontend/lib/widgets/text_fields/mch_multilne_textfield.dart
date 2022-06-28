import 'package:flutter/material.dart';

class MCHMutlilineTextField extends StatelessWidget {
  String? hint;
  double? width, height;

  TextEditingController? controller;
  Function(String)? onChanged;

  MCHMutlilineTextField({Key? key, this.hint, this.width, this.height,
    this.controller, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.width,
      height: this.height,
      child: TextField(
          controller: controller,
          onChanged: onChanged,
          minLines: 12,
          maxLines: 12,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 10),
              filled: true,
              fillColor: Color(0xFFEAF1FD),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(9)
              ),
              hintText: hint,
              hintStyle: TextStyle(color: Color(0xFFB8BEC7))
          )
      ),
    );
  }
}