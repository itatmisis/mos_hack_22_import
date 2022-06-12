import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/styles.dart';

class CatalogPageCatalog extends StatelessWidget {

  CatalogPageCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Styles.accentColor
      ),
      child: Center(
        child: Text('Каталог', style: TextStyle(color: Colors.white, fontSize: 18),),
      )
    );
  }
}