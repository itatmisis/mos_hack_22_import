import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/styles.dart';
import 'package:moscow_city_hack_web/widgets/mch_textfield.dart';

class ChooseList extends StatefulWidget {

  List<String> data;
  late void Function(int) onPressed = (i) {};

  late Color activeColor;

  ChooseList({Key? key, required this.data, void Function(int)? onPressed, Color? activeColor}) : super(key: key) {
    this.onPressed = onPressed?? this.onPressed;
    this.activeColor = activeColor?? Styles.accentColor;
  }

  @override
  State<ChooseList> createState() => _ChooseListState();
}

class _ChooseListState extends State<ChooseList> {

  int active = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.data.length,
      itemBuilder: (b, i) {
        return Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: RichText(
            text: TextSpan(
                text: widget.data[i],
                style: TextStyle(
                    color: i == active? widget.activeColor: Colors.black,
                    fontSize: 18
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() {
                      active = i;
                      widget.onPressed(i);
                    });
                  }
            ),
          ),
        );
      }
    );
  }
}