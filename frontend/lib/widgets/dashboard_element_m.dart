import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/styles.dart';
import 'package:moscow_city_hack_web/widgets/elevated_container/elevated_container.dart';


class DashboardElementM extends StatelessWidget {

  String text;
  int n, inf;

  DashboardElementM({super.key, required this.text, required this.n, required this.inf});

  @override
  Widget build(BuildContext context) {
    return ElevatedContainer(
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(text, style: TextStyle(color: Styles.grayTextColor, fontSize: 16),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(n.toString(), style: TextStyle(color: Colors.black, fontSize: 50),),
                inf != 0? Text(inf > 0? '+$inf':' $inf',
                  style: TextStyle(color: inf > 0? Colors.green:Colors.red, fontSize: 20)
                ):SizedBox()
              ],
            )
          ],
        ),
      ),
    );
  }
}