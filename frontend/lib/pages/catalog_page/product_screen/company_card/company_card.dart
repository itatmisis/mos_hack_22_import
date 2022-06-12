import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/styles.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_button.dart';
import 'package:moscow_city_hack_web/widgets/elevated_container/elevated_container.dart';

class CompanyCard extends StatelessWidget {

  CompanyCard({super.key});


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
                          Text('Название компании длинное', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                          SizedBox(height: 20,),
                          Text('ИНН: 0011229993334', style: TextStyle(fontSize: 16),),
                          SizedBox(height: 10,),
                          Text('Адрес: ул.  Вавилова, д. 86, к. 12', style: TextStyle(fontSize: 16),),
                          SizedBox(height: 10,),
                          Text('Представитель: Иван Иванович', style: TextStyle(fontSize: 16),),
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
                            child: MCHButton(onPressed: () {  }, text: '', color: Styles.cardCallButton,),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: MCHButton(onPressed: () {  }, text: '', color: Styles.cardSiteButton),
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