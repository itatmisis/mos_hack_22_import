import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/appbar/catalog_page_profile.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/appbar/catalog_page_search.dart';

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
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: SizedBox()
                  ),
                  Expanded(
                    flex: 3,
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
                    child: CatalogPageProfile(name: 'Павел Петров', subname: 'Название организации',),
                  )
                ],
              ),
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