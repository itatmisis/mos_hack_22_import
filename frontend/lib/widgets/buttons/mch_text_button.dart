import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../model/styles.dart';

class MCHTextButton extends StatefulWidget {
  void Function() onPressed;
  String text;
  double height = 18;

  Color? color;

  MCHTextButton({Key? key, required this.onPressed, required this.text, double? height, this.color}) : super(key: key) {
    this.height = height?? this.height;
  }

  @override
  State<MCHTextButton> createState() => _MCHTextButtonState();
}

class _MCHTextButtonState extends State<MCHTextButton> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: widget.text,
          style: TextStyle(
            color: widget.color?? Styles.accentColor,
            fontSize: widget.height
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = widget.onPressed),
    );
  }
}