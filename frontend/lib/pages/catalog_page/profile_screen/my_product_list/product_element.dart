import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/styles.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_page.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_page_model.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_screen/profile_screen_model.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_button.dart';
import 'package:provider/provider.dart';


class ProductElement extends StatelessWidget {

  ProductElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Styles.backgroundGray,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      flex: 10,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child:Text('Электровелосипед Kugoo Kirin V1',
                                style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child:Text('ИП “Петров Павел Евгеньевич”, ИНН: 1100992228345',
                                style: TextStyle(color: Styles.grayTextColor, fontSize: 16)),
                          )
                        ],
                      )
                    ),
                    Expanded(
                      flex: 4,
                      child: Consumer<CatalogPageModel>(
                        builder: (context, model, child) {
                          return MCHButton(onPressed: () {
                            model.currentPage = 4;
                          },
                            text: 'Посмотреть', color: Styles.cardCallButton, textColor: Styles.greenTextColor,);
                        },
                      )
                    )
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Divider(height: 0, thickness: 0, color: Color(0xFFE0E6EF),)
            )
          ],
        )
    );
  }
}