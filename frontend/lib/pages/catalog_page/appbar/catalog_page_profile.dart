import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/styles.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_page_model.dart';
import 'package:provider/provider.dart';

class CatalogPageProfile extends StatelessWidget {
  String name, subname;

  CatalogPageProfile({super.key, required this.name, required this.subname});


  @override
  Widget build(BuildContext context) {
    return Consumer<CatalogPageModel>(
      builder: (context, cart, child) {
        return TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            ),
            onPressed: () {
              if (cart.currentPage != 2) cart.currentPage = 2;
              else cart.currentPage = 0;
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Styles.accentColor,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  height: 50,
                  width: 50,
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(name, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                    Text(subname, style: TextStyle(color: Colors.black),)
                  ],
                )
              ],
            )
        );
      },
    );
  }
}