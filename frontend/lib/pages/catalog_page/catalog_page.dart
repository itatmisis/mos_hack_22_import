import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/appbar/catalog_page_appbar.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/grid/catalog_page_grid.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/left_bar/catalog_page_left_bar.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/subbar/catalog_page_subbar.dart';


class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scrollbar(
          thumbVisibility: true,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: 60,
                  child: CatalogPageAppbar(),
                ),
                Expanded(
                  flex: 13,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CatalogPageLeftBar(),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              child: CatalogPageSubbar(),
                            ),
                            Expanded(
                              child: CatalogPageGrid(),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}