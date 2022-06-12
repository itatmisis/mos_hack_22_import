import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moscow_city_hack_web/pages/login_page/login_page_model.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_button.dart';
import 'package:provider/provider.dart';

import '../login_page_container.dart';


class LoginPageSuccess extends StatelessWidget {
  const LoginPageSuccess({super.key});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
            alignment: Alignment.center,
            child: LoginPageContainer(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/galochka.svg', width: 110,),
                    const Text('Спасибо!',
                      style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 20,),
                    const Text('Мы рассмотрим вашу заявку\nи свяжемся с вами в ближайшее время',
                      textAlign: TextAlign.center,),
                    const SizedBox(height: 20,),
                    Consumer<LoginPageModel>(
                      builder: (context, cart, child) {
                        return MCHButton(onPressed: () {
                          cart.currentPage = 0;
                        }, text: 'Вернуться на главную', height: 55, width: 300,);
                      },
                    )
                  ],
                ),
              )
            )
        )
      ],
    );
  }
}