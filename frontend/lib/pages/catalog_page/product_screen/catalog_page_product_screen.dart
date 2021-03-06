import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_page_model.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/product_screen/chain/product_screen_chain.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/product_screen/company_card/company_card.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/product_screen/pictures_picker/pictures_picker.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/product_screen/similar/similar.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/product_screen/simple_specs/simple_specs.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/product_screen/simple_specs/simple_specs_element.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_text_button.dart';
import 'package:provider/provider.dart';


class CatalogPageProductScreen extends StatelessWidget {
  const CatalogPageProductScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<CatalogPageModel>(
          builder: (context, cart, child) {
            if (!cart.superSearch) {
              return WillPopScope(
                  onWillPop: () {
                    cart.currentPage = 0;
                    return new Future(() => false);
                  },
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                          child: SingleChildScrollView(
                              child: Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            MCHTextButton(onPressed: () {}, text: cart.activeId.category, height: 16,),
                                            SizedBox(height: 10,),
                                            Text(cart.activeId.name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
                                            SizedBox(height: 40,),
                                            SizedBox(
                                              height: 445,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height:445,
                                                    width: 500,
                                                    child: PicturesPicker(urls: [''],),
                                                  ),
                                                  Flexible(
                                                    flex: 4,
                                                    child: SimpleSpecs(),
                                                  ),
                                                  SizedBox(
                                                    height: 445,
                                                    width: 350,
                                                    child: CompanyCard(companyItem: cart.activeCompany,),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(left: 63, top: 30, bottom: 60),
                                                child: SizedBox(
                                                  height: 160,
                                                  child: ProductScreenChain(),
                                                )
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(left: 63, top: 30, bottom: 60),
                                                child: SizedBox(
                                                  height: 400,
                                                  child: Similar(),
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          )
                      );
                    },
                  )
              );
            } else {
              return WillPopScope(
                  onWillPop: () {
                    cart.currentPage = 0;
                    return new Future(() => false);
                  },
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                          child: SingleChildScrollView(
                              child: Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            MCHTextButton(onPressed: () {}, text: cart.activeCompany.category, height: 16,),
                                            SizedBox(height: 10,),
                                            Text(cart.activeCompany.company_name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
                                            SizedBox(height: 40,),
                                            SizedBox(
                                              height: 445,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height:445,
                                                    width: 500,
                                                    child: PicturesPicker(urls: [''],),
                                                  ),
                                                  Flexible(
                                                    flex: 4,
                                                    child: SimpleSpecs(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text('?????? ????????????????????????????', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
                                            SizedBox(height: 60,),
                                            ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: cart.activeCompany.specs.length,
                                              itemBuilder: (context, i) {
                                                return i >= 2? Column(
                                                  children: [
                                                    SimpleSpecsElement(spec: cart.activeCompany.specs[i], val: cart.activeCompany.items[i],),
                                                    SizedBox(height: 10,),
                                                  ],
                                                ):SizedBox();
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          )
                      );
                    },
                  )
              );
            }
          },
        )
    );
  }
}
