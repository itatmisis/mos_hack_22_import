import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_page_model.dart';
import 'package:moscow_city_hack_web/widgets/check_box_list/check_box_list.dart';
import 'package:moscow_city_hack_web/widgets/choose_list.dart';
import 'package:provider/provider.dart';


class CatalogPageLeftBar extends StatelessWidget {
  Widget? child;

  CatalogPageLeftBar({super.key, this.child});


  @override
  Widget build(BuildContext context) {
    return Consumer<CatalogPageModel>(
      builder: (context, cart, child) {
        return Container(
            child: Padding(
              padding: EdgeInsets.only(left: 40, top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Категория', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  SizedBox(
                      height: 300,
                      child: Scrollbar(
                        isAlwaysShown: true,
                        child: SingleChildScrollView(
                          child: ChooseList(data: ['Металлургия', 'Лесная промышленность', 'Химическая промышленность', 'Прочее производство', 'Легкая промышленность', 'Электронная и электротехническая промышленность', 'Коммунальное хозяйство и электроэнергетика', 'Сельское хозяйство', 'Промышленность строительных материалов', 'Медицинская промышленность', 'Пищевая промышленность', 'Транспортное машиностроение', 'Нефтегазовая промышленность', 'Судостроение', 'Авиационная промышленность', 'Горная промышленность', 'Космическая промышленность', 'Оборонно-промышленный комплекс', 'Ювелирная промышленность'],
                              onPressed: (i) {cart.category = i; print(i);}),
                        ),
                      )
                  ),
                  SizedBox(height: 40,),
                  cart.connection.proccessState == 2 && !cart.superSearch? Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Атрибуты товара', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                      SizedBox(height: 20,),
                      SizedBox(
                        height: 200,
                        child: CheckBoxList(data: cart.connection.companyNames),
                      ),
                    ],
                  ):SizedBox(),
                  SizedBox(height: 40,),
                ],
              ),
            )
        );
      },
    );
  }
}