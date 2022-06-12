import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/appbar/catalog_page_appbar.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_page_model.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_screen/catalog_page_catalog_screen.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/product_screen/catalog_page_product_screen.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_screen/profile_screen.dart';
import 'package:provider/provider.dart';


class CatalogPage extends StatelessWidget {

  List ch = [
    CatalogPageCatalogScreen(),
    CatalogPageProductScreen(),
    CatalogPageProfileScreen(),
  ];

  CatalogPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<CatalogPageModel>(
          create: (context) => CatalogPageModel(),
          child: Scrollbar(
            thumbVisibility: true,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 60,
                    child: CatalogPageAppbar(),
                  ),
                  Expanded(
                    flex: 13,
                    child: Consumer<CatalogPageModel>(
                      builder: (context, cart, child) {
                        return AnimatedSwitcher(
                            transitionBuilder: (Widget child, Animation<double> animation) {
                              return FadeTransition(
                                child: child,
                                opacity: animation,
                              );
                            },
                            duration: const Duration(milliseconds: 200),
                            child: ch[cart.currentPage]
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}