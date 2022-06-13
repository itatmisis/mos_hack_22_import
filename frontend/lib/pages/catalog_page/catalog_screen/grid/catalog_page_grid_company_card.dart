import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/styles.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_page_model.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_button.dart';
import 'package:provider/provider.dart';


class CatalogPageGridCompanyCard extends StatelessWidget {

  CompanyItem item;

  CatalogPageGridCompanyCard({super.key, required this.item});


  @override
  Widget build(BuildContext context) {
    return Consumer<CatalogPageModel>(
        builder: (context, cart, child) {
          return GestureDetector(
            onTap: () {
              cart.currentPage = 1;
              cart.activeCompany = this.item;
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
                                  child: Text(item.company_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(item.description, style: TextStyle(fontSize: 14),),
                                      SizedBox(height: 30,),
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