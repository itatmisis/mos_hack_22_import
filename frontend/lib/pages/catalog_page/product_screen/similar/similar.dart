import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/product_screen/similar/similar_element.dart';

class Similar extends StatelessWidget {
  const Similar({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Похожие товары', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
        SizedBox(height: 20,),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 15,
            itemBuilder: (context, i) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 200,
                    child: SimilarElement(),
                  ),
                  SizedBox(width: 10,)
                ],
              );
            },
          ),
        )
      ],
    );
  }
}