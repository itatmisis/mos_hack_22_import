import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/left_bar/catalog_page_slider.dart';
import 'package:moscow_city_hack_web/widgets/check_box_list/check_box_list.dart';
import 'package:moscow_city_hack_web/widgets/choose_list.dart';


class CatalogPageLeftBar extends StatelessWidget {
  Widget? child;

  CatalogPageLeftBar({super.key, this.child});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 40, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Категория', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            ChooseList(data: ['Комплектующие', 'Материалы', 'Оборудование', 'Сервисые услуги']),
            SizedBox(height: 40,),
            Text('Атрибуты товара', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            SizedBox(
              height: 200,
              child: CheckBoxList(data: List.generate(50, (index) => 'Вариант ${index}')),
            ),
            SizedBox(height: 40,),
          ],
        ),
      )
    );
  }
}