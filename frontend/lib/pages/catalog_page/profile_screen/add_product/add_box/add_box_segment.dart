import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/widgets/text_fields/mch_textfield.dart';


class AddBoxSegment extends StatelessWidget {

  Function(String)? onSpec, onValue;
  AddBoxSegment({super.key, this.onSpec, this.onValue});

  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Название характеристики'),
              SizedBox(height: 10,),
              MCHTextField(
                onChanged: onSpec,
              ),
            ],
          ),
        ),
        SizedBox(width: 20,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Значение'),
              SizedBox(height: 10,),
              MCHTextField(
                onChanged: onValue,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
