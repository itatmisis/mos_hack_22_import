import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/styles.dart';

class SimpleSpecsElement extends StatelessWidget {

  String spec, val;
  SimpleSpecsElement({super.key, required this.spec, required this.val});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(spec, style: TextStyle(fontSize: 16, color: Styles.grayTextColor, fontWeight: FontWeight.w300),),
        SizedBox(width: 5,),
        Expanded(
          child: Divider(),
        ),
        SizedBox(width: 5,),
        Text(val, style: TextStyle(fontSize: 16),),
      ],
    );
  }
}