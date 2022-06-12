import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_screen/add_product/add_box/add_box.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_screen/add_product/add_photo.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_button.dart';
import 'package:moscow_city_hack_web/widgets/text_fields/mch_multilne_textfield.dart';
import 'package:moscow_city_hack_web/widgets/text_fields/mch_textfield.dart';

class ProfileScreenAddProduct extends StatelessWidget {

  ProfileScreenAddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(right: 40, left: 40),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 40,),
                  Text('Добавление нового товара', style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),),
                  SizedBox(height: 60,),
                  Text('Основная информация', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 60,),
                  SizedBox(
                    height: 400,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Название товара'),
                                        SizedBox(height: 10,),
                                        MCHTextField(),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Категория'),
                                        SizedBox(height: 10,),
                                        MCHTextField(),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Описание'),
                                    SizedBox(height: 10),
                                    Expanded(
                                      child: MCHMutlilineTextField(),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, top: 24),
                            child: AddPhoto(),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 60,),
                  Text('Технические характеристики', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 60,),
                  AddBox(),
                  SizedBox(height: 20,),
                  SizedBox(
                    height: 65,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: MCHButton(onPressed: () {}, text: 'Отправить на модерацию'),
                          )
                        ),
                        Expanded(
                          flex: 2,
                          child: SizedBox(),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          )
        )
    );
  }
}