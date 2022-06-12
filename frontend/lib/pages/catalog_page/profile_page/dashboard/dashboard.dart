import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_page/dashboard/dashboard_element_l.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_page/dashboard/dashboard_element_m.dart';
import 'package:moscow_city_hack_web/widgets/elevated_container/elevated_container.dart';


class ProfileScreenDashboard extends StatelessWidget {

  ProfileScreenDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: ProfileScreenDashboardElementM(text: 'Просмотры сегодня', n: 101, inf: 51,),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: ProfileScreenDashboardElementM(text: 'Просмотры за месяц', n: 2341, inf: 1322,),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: ProfileScreenDashboardElementM(text: 'Просмотры за месяц', n: 33, inf: -12,),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: ProfileScreenDashboardElementM(text: 'Переходы на сайт за месяц', n: 1336, inf: 144,),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ProfileScreenDashboardElementL(),
                ),
              ),
            ],
          ),
        )
    );
  }
}