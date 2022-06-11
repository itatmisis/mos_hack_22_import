import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/styles.dart';

class CatalogPageProfile extends StatelessWidget {
  String name, subname;

  CatalogPageProfile({super.key, required this.name, required this.subname});


  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        ),
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Styles.accentColor,
              height: 50,
              width: 50,
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                Text(subname, style: TextStyle(color: Colors.black),)
              ],
            )
          ],
        )
    );
  }
}