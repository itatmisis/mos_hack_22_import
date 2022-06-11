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
    return Column(
      children: [
        Container(
          height: 70,
          color: Colors.white,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 50,),
                          Image.asset('assets/deptrans.png'),
                          Image.asset('assets/mosprom.png'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Container(
                          width: 160,
                          child: CatalogPageCatalog(),
                        ),
                      ),
                    ),

                    SizedBox(width: 90,),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Container(
                          width: 700,
                          child: CatalogPageSearch(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: CatalogPageProfile(name: 'Павел Петров', subname: 'Название организации',),
                ),
              )
            ],
          )
        ),
        Divider(height: 0, thickness: 0, color: Color(0xFFE0E6EF),)
      ],
    );
  }
}