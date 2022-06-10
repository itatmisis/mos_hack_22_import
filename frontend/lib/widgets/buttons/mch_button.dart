import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/styles.dart';

class MCHButton extends StatefulWidget {
  void Function() onPressed;
  String text;
  double? width, height;

  MCHButton({Key? key, required this.onPressed, required this.text, this.width, this.height}) : super(key: key);

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
            backgroundColor: MaterialStateProperty.all<Color>(Styles.accentColor),
            minimumSize: MaterialStateProperty.all<Size>(Size.infinite),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                )
            )
        ),
        onPressed: () { },
        child: Text(
          widget.text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18
          ),
        ),
      ),
    );
  }
}