import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_page_model.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/product_screen/simple_specs/simple_specs_element.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_text_button.dart';
import 'package:provider/provider.dart';

class SimpleSpecs extends StatelessWidget {

  SimpleSpecs({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CatalogPageModel>(
      builder: (context, cart, child) {
        if (!cart.superSearch) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Основные характеристики', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
                      SizedBox(height: 30,),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        itemBuilder: (context, i) {
                          return i >= 2? Column(
                            children: [
                              SimpleSpecsElement(spec: cart.activeId.specs[i], val: cart.activeId.items[i],),
                              SizedBox(height: 10,),
                            ],
                          ):SizedBox();
                        },
                      ),
                      SizedBox(height: 25),
                      MCHTextButton(onPressed: () {}, text: 'Перейти к полному описанию', height: 16,)
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Описание', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
                          SizedBox(height: 10,),
                          Text(
                              cart.activeId.name,
                              style: TextStyle(fontSize: 16)
                          )
                        ],
                      ),
                    )
                ),
              ],
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Основные характеристики', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
                      SizedBox(height: 30,),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        itemBuilder: (context, i) {
                          return i >= 2? Column(
                            children: [
                              SimpleSpecsElement(spec: cart.activeCompany.specs[i], val: cart.activeCompany.items[i],),
                              SizedBox(height: 10,),
                            ],
                          ):SizedBox();
                        },
                      ),
                      SizedBox(height: 25),
                      MCHTextButton(onPressed: () {}, text: 'Перейти к полному описанию', height: 16,)
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Описание', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
                          SizedBox(height: 10,),
                          Text(
                              cart.activeCompany.description.length > 200? cart.activeCompany.description.substring(0, 197) + '..' : cart.activeCompany.description,
                              style: TextStyle(fontSize: 16)
                          )
                        ],
                      ),
                    )
                ),
              ],
            ),
          );
        }
      },
    );
  }
}