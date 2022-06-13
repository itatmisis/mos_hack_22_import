import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/app_model.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/appbar/catalog_page_profile.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/appbar/catalog_page_search.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_page_model.dart';
import 'package:provider/provider.dart';

import 'catalog_page_catalog.dart';

class CatalogPageAppbar extends StatelessWidget {
  double? width, height;
  Widget? child;

  CatalogPageAppbar({super.key, this.child, this.width, this.height});


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child:  Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Consumer<CatalogPageModel>(
                          builder: (context, cart, child) {
                            return GestureDetector(
                              onTap: () {
                                cart.currentPage = 3;
                              },
                              child: Row(
                                children: [
                                  Image.asset('assets/deptrans.png'),
                                  Image.asset('assets/mosprom.png'),
                                ],
                              ),
                            );
                          },
                        )
                    ),
                    Expanded(
                      flex: 4,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 3,
                            child: CatalogPageCatalog(),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 12,
                            child: CatalogPageSearch(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Consumer<AppModel> (
                        builder: (context, cart, child) {
                          return CatalogPageProfile(name: cart.name, subname: cart.company,);
                        },
                      )
                    )
                  ],
                ),
              )
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Divider(height: 0, thickness: 0, color: Color(0xFFE0E6EF),)
          )
        ],
      ),
    );
  }
}