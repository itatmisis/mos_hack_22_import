import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductScreenChainElement extends StatelessWidget {

  ProductScreenChainElement({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Отправка товара'),
        Text('Распределительный\nпункт №1220'),
      ],
    );
  }
}