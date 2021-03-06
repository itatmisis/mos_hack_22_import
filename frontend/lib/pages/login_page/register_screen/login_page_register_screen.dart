import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/pages/login_page/login_page_model.dart';
import 'package:moscow_city_hack_web/widgets/adv_widget.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_button.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_text_button.dart';
import 'package:moscow_city_hack_web/widgets/text_fields/mch_textfield.dart';
import 'package:provider/provider.dart';

import '../login_page_container.dart';


class LoginPageRegisterScreen extends StatelessWidget {
  const LoginPageRegisterScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 1400,
              height: 850,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: LoginPageContainer(
                      height: 850,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 60, bottom: 70, left: 50),
                            child: SizedBox(
                              height: 40,
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
                                Text('???????????? ???? ??????????????????????', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
                                SizedBox(height: 30,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('????????????'),
                                          SizedBox(height: 10,),
                                          MCHTextField(hint: '????????????',),
                                          SizedBox(height: 20,),
                                          Text('??????'),
                                          SizedBox(height: 10,),
                                          MCHTextField(hint: '001122334455',),
                                          SizedBox(height: 20,),
                                          Text('?????? ??????????????????????????'),
                                          SizedBox(height: 10,),
                                          MCHTextField(hint: '???????????? ???????? ????????????????????',),
                                          SizedBox(height: 20,),
                                          Text('Email'),
                                          SizedBox(height: 10,),
                                          MCHTextField(hint: 'hack@ya.ru',),
                                          SizedBox(height: 40,),
                                          Consumer<LoginPageModel>(
                                            builder: (context, cart, child) {
                                              return MCHButton(onPressed: () {
                                                cart.currentPage = 2;
                                              }, text: '???????????? ????????????', height: 55);
                                            }
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 20,),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('?????????? ??????????????????????'),
                                          SizedBox(height: 10,),
                                          MCHTextField(hint: '???? ?? ??????',),
                                          SizedBox(height: 20,),
                                          Text('???????????????? ??????????????????????'),
                                          SizedBox(height: 10,),
                                          MCHTextField(hint: '???? ??????????? ????????????????????  ???????????????',),
                                          SizedBox(height: 20,),
                                          Text('??????????????????'),
                                          SizedBox(height: 10,),
                                          MCHTextField(hint: '?????????????????????? ????????????????',),
                                          SizedBox(height: 20,),
                                          Text('?????????? ????????????????'),
                                          SizedBox(height: 10,),
                                          MCHTextField(hint: '8-800-555-35-35',),
                                          SizedBox(height: 55,),
                                          Consumer<LoginPageModel>(
                                              builder: (context, cart, child) {
                                                return MCHTextButton(onPressed: () {
                                                  cart.currentPage = 1;
                                                }, text: '?????? ???????? ??????????????? ?????????? ->'
                                                );
                                              }
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: LoginPageContainer(
                              child: Center(
                                child: Image.asset('assets/adv2.png', height: 150,),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Expanded(
                            flex: 2,
                            child: LoginPageContainer(
                              child: AdvWidget(),
                            ),
                          )
                        ],
                      )
                  )
                ],
              ),
            )
        )
      ],
    );
  }
}