import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moscow_city_hack_web/model/styles.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_page_model.dart';
import 'package:provider/provider.dart';

class CatalogPageCatalog extends StatelessWidget {

  CatalogPageCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CatalogPageModel>(
        builder: (context, cart, child) {
          return GestureDetector(
            onTap: () {
              cart.currentPage = 0;
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Styles.accentColor
                ),
                child: Center(
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        SvgPicture.asset('assets/three_lines.svg', height: 18,),
                        SizedBox(width: 8,),
                        Text('Каталог', style: TextStyle(color: Colors.white, fontSize: 18),),
                      ],
                    )
                )
            ),
          );
        }
    );
  }
}