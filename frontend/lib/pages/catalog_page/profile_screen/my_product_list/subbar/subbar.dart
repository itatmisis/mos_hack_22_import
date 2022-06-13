import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/app_model.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_screen/profile_screen_model.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_button.dart';
import 'package:provider/provider.dart';


class Subbar extends StatelessWidget {

  Subbar({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<AppModel>(
                      builder: (context, model, child) {
                        return Consumer<ProfileScreenModel>(
                          builder: (context, cart, child) {
                            return model.userType == 'company'?
                            Text('Текущие товары',
                              style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),)
                                : Text('На модерации',
                              style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),);
                          },
                        );
                      },
                    ),
                    Expanded(
                      flex: 5,
                      child: SizedBox(),
                    ),
                    Consumer<AppModel>(
                      builder: (context, model, child) {
                        return Consumer<ProfileScreenModel>(
                          builder: (context, cart, child) {
                            return model.userType == 'company'? MCHButton(onPressed: () {
                              cart.currentPage = 2;
                            }, text: 'Добавить товар', color: Colors.green, width: 200,): SizedBox();
                          },
                        );
                      },
                    ),
                    SizedBox(
                      width: 65,
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
}