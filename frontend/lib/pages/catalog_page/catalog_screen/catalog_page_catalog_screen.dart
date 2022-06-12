import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_screen/grid/catalog_page_grid.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_screen/left_bar/catalog_page_left_bar.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_screen/subbar/catalog_page_subbar.dart';

class CatalogPageCatalogScreen extends StatelessWidget {
  const CatalogPageCatalogScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
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
        )
    );
  }
}