import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class ProductScreenChain extends StatelessWidget {

  ProductScreenChain({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Цепочка поставки', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
        SizedBox(height: 20,),
        Flexible(
          child: SvgPicture.asset('assets/chain.svg', alignment: Alignment.centerLeft,),
        )
      ],
    );
  }
}