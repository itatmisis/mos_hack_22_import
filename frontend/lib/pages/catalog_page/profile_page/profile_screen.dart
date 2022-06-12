import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_page/dashboard/dashboard.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_page/left_bar/profile_screen_left_bar.dart';

class CatalogPageProfileScreen extends StatelessWidget {
  const CatalogPageProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ProfileScreenLeftBar(),
              ),
              Expanded(
                flex: 3,
                child: ProfileScreenDashboard(),
              )
            ],
          ),
        )
    );
  }
}