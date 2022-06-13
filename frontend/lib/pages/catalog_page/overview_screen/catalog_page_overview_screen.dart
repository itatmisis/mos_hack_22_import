import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/app_model.dart';
import 'package:moscow_city_hack_web/model/styles.dart';
import 'package:moscow_city_hack_web/widgets/adv_widget.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_button.dart';
import 'package:moscow_city_hack_web/widgets/dashboard_element_m.dart';
import 'package:moscow_city_hack_web/widgets/elevated_container/elevated_container.dart';
import 'package:provider/provider.dart';

class CatalogPageOverviewScreen extends StatelessWidget {

  CatalogPageOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(left: 80, top: 60, right: 80, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<AppModel>(
                  builder: (context, cart, child) {
                    return Text('Здравствуйте, ${cart.name.split(' ')[0]}',
                        style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold));
                  },
                ),
                SizedBox(height: 40,),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 2,
                        child: DashboardElementM(text: 'Компаний на сайте', n: 17644, inf: 0,)
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        flex: 2,
                        child: DashboardElementM(text: 'Российских товаров на сайте', n: 66556, inf: 0,)
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        flex: 2,
                        child: DashboardElementM(text: 'Московских товаров на сайте', n: 7389, inf: 0,)
                      ),
                      SizedBox(width: 40,),
                      Expanded(
                        flex: 3,
                        child: ElevatedContainer(
                          child: Center(
                            child: Image.asset('assets/h1.png', width: 300,),
                          ),
                        )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Компании по категориям',
                              style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                            SizedBox(height: 20,),
                            Expanded(
                              child: ElevatedContainer(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: ElevatedContainerDecoration(
                                    beautifulPadding: BeautuifulPadding.none
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Image.asset('assets/screen.png'),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Padding(
                                            padding: EdgeInsets.all(30),
                                            child: SizedBox(
                                              height: 50,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      flex: 2,
                                                      child: Text('Как нейросеть видит наши данные?',
                                                        style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: MCHButton(onPressed: () {},
                                                      text: 'Посмотреть', color: Styles.cardCallButton, textColor: Styles.greenTextColor,),
                                                  )
                                                ],
                                              ),
                                            )
                                        )
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Новости',
                                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                              SizedBox(height: 20,),
                              Expanded(
                                child: ElevatedContainer(
                                  child: AdvWidget(),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}