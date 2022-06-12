import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_screen/dashboard/chart.dart';
import 'package:moscow_city_hack_web/widgets/elevated_container/elevated_container.dart';

import 'dart:html' as html;
import 'dart:js' as js;
import 'dart:ui' as ui;

class WebView extends StatelessWidget {


  WebView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'assets/graph.html',
            (int id) => html.IFrameElement()
          ..width = MediaQuery.of(context).size.width.toString()
          ..height = MediaQuery.of(context).size.height.toString()
          ..src = 'assets/plot_full.html'
          ..style.border = 'none'
    );
    return SizedBox(
      child: HtmlElementView(
        viewType: 'assets/graph.html',
      ),
    );
  }
}