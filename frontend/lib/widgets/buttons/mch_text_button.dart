import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../model/styles.dart';

class MCHTextButton extends StatefulWidget {
  void Function() onPressed;
  String text;

  MCHTextButton({Key? key, required this.onPressed, required this.text}) : super(key: key);

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
            color: Styles.accentColor,
            fontSize: 18
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = widget.onPressed),
    );
  }
}