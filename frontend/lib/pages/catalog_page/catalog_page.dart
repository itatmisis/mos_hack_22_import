import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_page_appbar.dart';


class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
            children: [
              CatalogPageAppbar()
            ],
          ),
        )
    );
  }
}