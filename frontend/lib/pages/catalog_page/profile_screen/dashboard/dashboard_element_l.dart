import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_screen/dashboard/chart.dart';
import 'package:moscow_city_hack_web/widgets/elevated_container/elevated_container.dart';


class ProfileScreenDashboardElementL extends StatelessWidget {


  ProfileScreenDashboardElementL({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedContainer(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text('Активность пользователей', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            Expanded(
              child: Chart(),
            )
          ],
        ),
      ),
    );
  }
}