import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moscow_city_hack_web/model/styles.dart';
import 'package:moscow_city_hack_web/pages/login_page/login_page_model.dart';
import 'package:moscow_city_hack_web/pages/login_page/login_screen/login_page_login_screen.dart';
import 'package:moscow_city_hack_web/pages/login_page/register_screen/login_page_register_screen.dart';
import 'package:moscow_city_hack_web/pages/login_page/register_screen/login_page_success.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {

  List ch = [
    LoginPageRegisterScreen(),
    LoginPageLoginScreen(),
    LoginPageSuccess()
  ];


  LoginPage({super.key}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Styles.backgroundColor,
        child: ChangeNotifierProvider<LoginPageModel>(
          create: (context) => LoginPageModel(),
          child: Consumer<LoginPageModel>(
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
        ),
      ),
    );
  }
}

