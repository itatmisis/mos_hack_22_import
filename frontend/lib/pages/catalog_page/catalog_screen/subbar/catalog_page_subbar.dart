import 'package:flutter/material.dart';


class CatalogPageSubbar extends StatelessWidget {
  Widget? child;

  CatalogPageSubbar({super.key, this.child});


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
                  children: [
                    Container(
                      width: 200,
                      color: Colors.blue,
                    ),
                    Expanded(
                      flex: 5,
                      child: SizedBox(),
                    ),
                    Container(
                      width: 200,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 200,
                      color: Colors.blue,
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