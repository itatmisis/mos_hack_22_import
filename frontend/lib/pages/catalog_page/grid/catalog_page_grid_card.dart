import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/styles.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_button.dart';


class CatalogPageGridCard extends StatelessWidget {

  CatalogPageGridCard({super.key});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('sdsdsd');
      },
      child: Column(
        children: [
          Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Styles.backgroundGray,
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Expanded(
                      flex: 2,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text('Название товара'),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Компания'),
                                Text('ИНН'),
                                SizedBox(
                                  height: 40,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: MCHButton(onPressed: () {  }, text: '', color: Styles.cardCallButton,),
                                      ),
                                      SizedBox(width: 10,),
                                      Expanded(
                                        child: MCHButton(onPressed: () {  }, text: '', color: Styles.cardSiteButton),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
            ),
          ),
          Divider(height: 0,)
        ],
      ),
    );
  }
}