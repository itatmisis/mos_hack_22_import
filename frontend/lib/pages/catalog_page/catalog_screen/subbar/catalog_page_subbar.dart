import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/styles.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_page_model.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_button.dart';
import 'package:provider/provider.dart';


class CatalogPageSubbar extends StatelessWidget {
  Widget? child;

  CatalogPageSubbar({super.key, this.child});


  @override
  Widget build(BuildContext context) {
    return Consumer<CatalogPageModel>(
        builder: (context, cart, child) {
          return Container(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 250,
                            child: Row(
                              children: [
                                Switch(
                                  value: cart.superSearch,
                                  onChanged: (value) {
                                    cart.superSearch = !cart.superSearch;
                                  },
                                  activeTrackColor: Styles.accentColor,
                                  activeColor: Styles.accentColor,
                                ),
                                Text('Расширенный поиск', style: TextStyle(fontSize: 16),)
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: SizedBox(),
                          ),
                          SizedBox(
                            width: 200,
                            child: MCHButton(
                              color: Color(0xFF1F6641), onPressed: () {  }, text: 'Экспорт в Excel',
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Divider(height: 0, thickness: 0, color: Color(0xFFE0E6EF),)
                  )
                ],
              )
          );
        }
    );
  }
}