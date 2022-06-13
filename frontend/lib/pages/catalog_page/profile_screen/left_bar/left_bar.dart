import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/app_model.dart';
import 'package:moscow_city_hack_web/model/styles.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_screen/profile_screen_model.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_text_button.dart';
import 'package:moscow_city_hack_web/widgets/choose_list.dart';
import 'package:provider/provider.dart';


class LeftBar extends StatelessWidget {
  LeftBar({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: EdgeInsets.only(left: 40, top: 40),
          child: Consumer<ProfileScreenModel>(
            builder: (context, cart, child) {
              return Consumer<AppModel>(
                  builder: (context, model, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Styles.accentColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(height: 30,),
                        Text(model.name, style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
                        SizedBox(height: 20,),
                        Text(model.company, style: TextStyle(color: Colors.black, fontSize: 16),),
                        SizedBox(height: 5,),
                        Text(model.inn, style: TextStyle(color: Styles.grayTextColor, fontSize: 16),),
                        SizedBox(height: 40,),
                        Text('Категория', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                        SizedBox(height: 20,),
                        ChooseList(data: ['Отчет и аналитикиа', 'Моя компания', 'Мой профиль', 'Государственная помощь'], onlyActive: true, onPressed: (i) {
                          if (i == 0) {
                            cart.currentPage = 0;
                          }
                        },),
                        SizedBox(height: 40,),
                        Text('Производство', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                        SizedBox(height: 20,),
                        ChooseList(data: ['Товары', 'Поиск площадок', 'Мои заявки на закупку'], onlyActive: true, onPressed: (i) {
                          if (i == 0) {
                            cart.currentPage = 1;
                          }
                        },),
                        SizedBox(height: 40,),
                        MCHTextButton(onPressed: () {
                          Navigator.pushReplacementNamed(context, '/loginPage');
                        }, text: 'Выход', color: Colors.red,)
                      ],
                    );
                  }
              );
            },
          )
        )
    );
  }
}