import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/appbar/catalog_page_appbar.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/left_bar/catalog_page_left_bar.dart';


class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              CatalogPageAppbar(),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CatalogPageLeftBar(),
                  ),
                  Expanded(
                    flex: 7,
                    child: SizedBox(),
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}