import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/app_model.dart';
import 'package:moscow_city_hack_web/pages/login_page/login_page_model.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_button.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_text_button.dart';
import 'package:moscow_city_hack_web/widgets/text_fields/mch_textfield.dart';
import 'package:provider/provider.dart';

import '../login_page_container.dart';


class LoginPageLoginScreen extends StatelessWidget {
  String login = '', pass = '';

  LoginPageLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, cart, child) {
        return Stack(
          children: [
            Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 500,
                  height: 850,
                  child: Column(
                    children: [
                      LoginPageContainer(
                        height: 650,
                        width: 500,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 40, bottom: 90),
                              child: SizedBox(
                                height: 60,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset('assets/deptrans.png'),
                                    Image.asset('assets/mosprom.png'),

                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MCHTextField(hint: '?????????? (user ?????? moder)', onChanged: (s) {login = s;}),
                                  SizedBox(height: 30,),
                                  MCHTextField(hint: '???????????? (123)', onChanged: (s) {pass = s;}),
                                  SizedBox(height: 20,),
                                  MCHTextButton(onPressed: () {}, text: '????????????????????????'),
                                  SizedBox(height: 50,),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        MCHButton(onPressed: () {
                                          if (login == 'user' && pass == '123') {
                                            cart.userType = 'company';
                                            Navigator.pushReplacementNamed(context, '/catalogPage', );
                                          } else if (login == 'moder' && pass == '123') {
                                            cart.userType = 'moderator';
                                            Navigator.pushReplacementNamed(context, '/catalogPage', );
                                          }
                                        }, text: '??????????', height: 55),
                                        SizedBox(height: 40,),
                                        MCHTextButton(onPressed: () {}, text: '???? ?????????????? ???????????'),
                                        SizedBox(height: 40,),
                                        Consumer<LoginPageModel>(
                                            builder: (context, cart, child) {
                                              return MCHTextButton(onPressed: () {
                                                cart.currentPage = 0;
                                              }, text: '????????????????????????????????????'
                                              );
                                            }
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      LoginPageContainer(
                        height: 80,
                        child: Center(
                          child: Image.asset('assets/gos.png'),
                        ),
                      ),
                    ],
                  ),
                )
            )
          ],
        );
      },
    );
  }
}