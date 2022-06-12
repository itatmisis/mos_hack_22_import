import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moscow_city_hack_web/model/app_model.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_screen/add_product/add_box/add_box.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_screen/add_product/add_photo.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_screen/profile_screen_model.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_button.dart';
import 'package:moscow_city_hack_web/widgets/text_fields/mch_multilne_textfield.dart';
import 'package:moscow_city_hack_web/widgets/text_fields/mch_textfield.dart';
import 'package:provider/provider.dart';

class ProfileScreenThanks extends StatelessWidget {

  ProfileScreenThanks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: Consumer<AppModel>(
          builder: (context, model, child) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('assets/galochka.svg', width: 110,),
                  const Text('Спасибо!',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),
                  Text(model.userType == 'company'?
                  'Мы рассмотрим вашу заявку\nи свяжемся с вами в ближайшее время' : 'Предложение будет размещено\nв ближайшее время',
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
                  const SizedBox(height: 20,),
                  Consumer<ProfileScreenModel>(
                    builder: (context, cart, child) {
                      return MCHButton(onPressed: () {
                        cart.currentPage = 0;
                      }, text: 'Вернуться на главную', height: 55, width: 300,);
                    },
                  )
                ],
              ),
            );
          },
        )
    );
  }
}