import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/styles.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_page_model.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_button.dart';
import 'package:provider/provider.dart';


class CatalogPageGridCard extends StatelessWidget {

  DataItem item;

  CatalogPageGridCard({super.key, required this.item});


  @override
  Widget build(BuildContext context) {
    return Consumer<CatalogPageModel>(
        builder: (context, cart, child) {
          return GestureDetector(
            onTap: () {
              cart.currentPage = 1;
              cart.activeId = this.item;
              cart.activeCompany = cart.connection.company.firstWhere((element) => this.item.company_name == element.company_name);
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
                              child: Image.asset('assets/image.png'),
                            ),
                          ),
                          SizedBox(height: 30,),
                          Expanded(
                            flex: 2,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(item.company_name, style: TextStyle(fontSize: 14),),
                                      SizedBox(height: 10,),
                                      Text(item.inn, style: TextStyle(fontSize: 14, color: Styles.grayTextColor),),
                                      SizedBox(height: 20,),
                                      SizedBox(
                                        height: 40,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: MCHButton(onPressed: () { }, text: 'Позвонить', color: Styles.cardCallButton,
                                                  textColor: Color(0xFF4D7560)),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: MCHButton(onPressed: () { }, text: 'Сайт', color: Styles.cardSiteButton,
                                                  textColor: Color(0xFF566481)),
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
    );
  }
}