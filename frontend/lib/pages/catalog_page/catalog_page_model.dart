import 'package:flutter/material.dart';

class CatalogPageModel extends ChangeNotifier {
  ScrollController _controller = ScrollController();

  ScrollController get controller => _controller;

  set controller(ScrollController value) {
    _controller = value;
    notifyListeners();
  }
}