import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/styles.dart';
import 'package:moscow_city_hack_web/widgets/check_box_list/check_box_list.dart';
import 'package:moscow_city_hack_web/widgets/choose_list.dart';


class ProfileScreenLeftBar extends StatelessWidget {
  ProfileScreenLeftBar({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: EdgeInsets.only(left: 40, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Styles.accentColor,
                  borderRadius: BorderRadius.circular(100)
                ),
              ),
              SizedBox(height: 30,),
              Text('Павел Петров', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text('ИП “Петров Павел Евгеньевич”', style: TextStyle(color: Colors.black, fontSize: 16),),
              SizedBox(height: 5,),
              Text('ИНН: 1100992228345', style: TextStyle(color: Styles.grayTextColor, fontSize: 16),),
              SizedBox(height: 40,),
              Text('Категория', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              ChooseList(data: ['Отчет и аналитикиа', 'Моя компания', 'Мой профиль', 'Государственная помощь']),
              SizedBox(height: 40,),
              Text('Производство', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              ChooseList(data: ['Товары', 'Поиск площадок', 'Мои заявки на закупку'], activeColor: Colors.black,),
            ],
          ),
        )
    );
  }
}