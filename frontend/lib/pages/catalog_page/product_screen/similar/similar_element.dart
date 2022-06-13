import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/styles.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_page_model.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_button.dart';
import 'package:provider/provider.dart';


class SimilarElement extends StatelessWidget {

  DataItem item;
  SimilarElement({super.key, required this.item});


  @override
  Widget build(BuildContext context) {
    return Consumer<CatalogPageModel>(
        builder: (context, cart, child) {
          return GestureDetector(
            onTap: () {
              cart.activeId = item;
              cart.activeCompany = cart.connection.company.firstWhere((element) => this.item.company_name == element.company_name);
              cart.currentPage = 1;
            },
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
                            child: Text(item.name),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(item.company_name),
                                Text('ИНН: ' + item.inn),
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
          );
        }
    );
  }
}