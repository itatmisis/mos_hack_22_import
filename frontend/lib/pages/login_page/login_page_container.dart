import 'package:flutter/material.dart';

class LoginPageContainer extends StatelessWidget {
  double? width, height;
  Widget? child;
  
  LoginPageContainer({super.key, this.child, this.width, this.height});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      height: height,
      width: width,
      child: child,
    );
  }
}