import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/styles.dart';

class MCHButton extends StatefulWidget {
  void Function() onPressed;
  String text;
  double? width, height;
  late Color color, textColor;

  MCHButton({Key? key, required this.onPressed,
    required this.text, this.width, this.height, Color? color, Color? textColor}) : super(key: key) {
    this.color = color ?? Styles.accentColor;
    this.textColor = textColor ?? Colors.white;
  }

  @override
  State<MCHButton> createState() => _MCHButtonState();
}

class _MCHButtonState extends State<MCHButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(widget.color),
            minimumSize: MaterialStateProperty.all<Size>(Size.infinite),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                )
            )
        ),
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: TextStyle(
              color: widget.textColor,
              fontSize: 18
          ),
        ),
      ),
    );
  }
}