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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppModel>(
      create: (context) => AppModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/loginPage': (BuildContext context) => LoginPage(),
        },
        debugShowCheckedModeBanner: false,

        onGenerateRoute: (settings) {
          if (settings.name == "/catalogPage") {
            return PageRouteBuilder(
                settings: settings,
                pageBuilder: (_, __, ___) => CatalogPage(),
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