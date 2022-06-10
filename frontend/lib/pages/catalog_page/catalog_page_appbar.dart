import 'package:flutter/material.dart';

class CatalogPageAppbar extends StatelessWidget {
  double? width, height;
  Widget? child;

  CatalogPageAppbar({super.key, this.child, this.width, this.height});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          color: Colors.white,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 50,),
                          Image.asset('assets/deptrans.png'),
                          Image.asset('assets/mosprom.png'),
                        ],
                      ),
                    ),

                    SizedBox(width: 200,),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Container(
                          width: 160,
                          color: Colors.blue,
                        ),
                      ),
                    ),

                    SizedBox(width: 90,),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Container(
                          width: 700,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    SizedBox(width: 90,),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Container(
                          width: 700,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ),
        Divider(height: 0, thickness: 0, color: Color(0xFFE0E6EF),)
      ],
    );
  }
}