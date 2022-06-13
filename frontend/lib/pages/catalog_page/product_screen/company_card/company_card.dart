import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/styles.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_page_model.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_button.dart';
import 'package:moscow_city_hack_web/widgets/elevated_container/elevated_container.dart';

class CompanyCard extends StatelessWidget {

  CompanyItem companyItem;
  CompanyCard({super.key, required this.companyItem});


  @override
  Widget build(BuildContext context) {
    return ElevatedContainer(
      decoration: ElevatedContainerDecoration(
        borderRadius: 9,
        beautifulPadding: BeautuifulPadding.none,
        shadowColor: Color(0x3292AAEF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 13,
            child: Container(
              color: Styles.backgroundGray,
            ),
          ),
          Expanded(
            flex: 15,
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(companyItem.company_name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                          SizedBox(height: 20,),
                          Text('ИНН: '+ companyItem.inn, style: TextStyle(fontSize: 16),),
                          SizedBox(height: 10,),
                          Text(companyItem.address, style: TextStyle(fontSize: 16),),
                          SizedBox(height: 10,),
                          Text(companyItem.phone, style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}