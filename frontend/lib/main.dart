import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/app_model.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_page.dart';
import 'package:moscow_city_hack_web/pages/login_page/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppModel>(
      create: (context) => AppModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,

        onGenerateRoute: (settings) {
          if (settings.name == "/catalogPage") {
            return PageRouteBuilder(
                settings: settings,
                pageBuilder: (_, __, ___) => CatalogPage(),
                transitionsBuilder:
                    (_, a, __, c) => FadeTransition(opacity: a, child: c)
            );
          } else if (settings.name == "/loginPage") {
            return PageRouteBuilder(
                settings: settings,
                pageBuilder: (_, __, ___) => LoginPage(),
                transitionsBuilder:
                    (_, a, __, c) => FadeTransition(opacity: a, child: c)
            );
          }
          return null;
        },

        initialRoute: '/loginPage',
      ),
    );
  }
}