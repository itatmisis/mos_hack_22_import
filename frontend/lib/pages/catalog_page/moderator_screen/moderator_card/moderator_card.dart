import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/styles.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_page_model.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_button.dart';
import 'package:moscow_city_hack_web/widgets/elevated_container/elevated_container.dart';
import 'package:moscow_city_hack_web/widgets/text_fields/mch_multilne_textfield.dart';
import 'package:provider/provider.dart';

class ModeratorCard extends StatelessWidget {

  ModeratorCard({super.key});


  @override
  Widget build(BuildContext context) {
    return ElevatedContainer(
      decoration: ElevatedContainerDecoration(
        borderRadius: 9,
        beautifulPadding: BeautuifulPadding.none,
        shadowColor: Color(0x3292AAEF),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: MCHMutlilineTextField(),
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: EdgeInsets.all(15),
                child: SizedBox(
                  height: 40,
                  child: Consumer<CatalogPageModel> (
                    builder: (context, model, child) {
                      return Row(
                        children: [
                          Expanded(
                            child: MCHButton(onPressed: () { model.currentPage = 2; }, text: 'Опубликовать', color: Styles.cardCallButton,
                            textColor: Color(0xFF4D7560)),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: MCHButton(onPressed: () { model.currentPage = 2; }, text: 'Переработать', color: Styles.cardSiteButton,
                            textColor: Color(0xFF566481)),
                          )
                        ],
                      );
                    },
                  )
                )
            )
          ),
        ],
      ),
    );
  }
}