import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/styles.dart';

class SimpleSpecsElement extends StatelessWidget {

  SimpleSpecsElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Характеристика', style: TextStyle(fontSize: 16, color: Styles.grayTextColor, fontWeight: FontWeight.w300),),
        SizedBox(width: 5,),
        Expanded(
          child: Divider(),
        ),
        SizedBox(width: 5,),
        Text('Значение', style: TextStyle(fontSize: 16),),
      ],
    );
  }
}