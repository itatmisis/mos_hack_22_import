import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/app_model.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_screen/my_product_list/product_element.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_screen/my_product_list/subbar/subbar.dart';
import 'package:provider/provider.dart';


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
              SizedBox(height: 20),
              Consumer<AppModel>(
                builder: (context, cart, child) {
                  return cart.userType == 'moderator'? SizedBox(
                    height: 70,
                    child: ProductElement(),
                  ) : SizedBox();
                },
              )
            ],
          ),
        )
    );
  }
}