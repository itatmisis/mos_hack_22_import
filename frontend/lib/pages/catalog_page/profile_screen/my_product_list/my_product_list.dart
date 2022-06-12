import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_screen/my_product_list/subbar/subbar.dart';


class MyProductList extends StatelessWidget {

  MyProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              Container(
                height: 60,
                child: Subbar(),
              ),
            ],
          ),
        )
    );
  }
}