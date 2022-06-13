import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/product_screen/simple_specs/simple_specs_element.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_text_button.dart';

class SimpleSpecs extends StatelessWidget {

  SimpleSpecs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Основные характеристики', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
                SizedBox(height: 30,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        SimpleSpecsElement(spec: 'Характеристика', val: 'Количество',),
                        SizedBox(height: 10,),
                      ],
                    );
                  },
                ),
                SizedBox(height: 25),
                MCHTextButton(onPressed: () {}, text: 'Перейти к полному описанию', height: 16,)
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Описание', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
                SizedBox(height: 10,),
                Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in',
                    style: TextStyle(fontSize: 16)
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}