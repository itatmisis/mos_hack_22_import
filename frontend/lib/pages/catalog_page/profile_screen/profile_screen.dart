import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_screen/add_product/add_product.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_screen/dashboard/dashboard.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_screen/left_bar/left_bar.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_screen/my_product_list/my_product_list.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_screen/profile_screen_model.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_screen/thanks/profile_screen_thanks.dart';
import 'package:provider/provider.dart';

class CatalogPageProfileScreen extends StatelessWidget {
  const CatalogPageProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<ProfileScreenModel>(
          create: (context) => ProfileScreenModel(),
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: LeftBar(),
                ),
                Expanded(
                  flex: 3,
                  child: Consumer<ProfileScreenModel>(
                    builder: (context, cart, child) {
                      return AnimatedSwitcher(
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              child: child,
                              opacity: animation,
                            );
                          },
                          duration: const Duration(milliseconds: 200),
                          child: [
                            ProfileScreenDashboard(),
                            MyProductList(),
                            ProfileScreenAddProduct(),
                            ProfileScreenThanks(),
                          ][cart.currentPage]
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}