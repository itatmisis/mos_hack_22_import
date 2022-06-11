import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_page_model.dart';
import 'package:provider/provider.dart';

import 'catalog_page_grid_card.dart';

class CatalogPageGrid extends StatelessWidget {
  const CatalogPageGrid({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: GridView.builder(
              controller: ScrollController(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 0,
                  childAspectRatio: 0.528
              ),
              itemCount: 300,

              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(top:20),
                  child: CatalogPageGridCard(),
                );
              }
            ),
          )
        ),
        SizedBox(width: 60,)
      ],
    );
  }
}